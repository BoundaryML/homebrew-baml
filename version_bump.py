import argparse
import json
from pathlib import Path
import re

class Args:
    def __init__(self, version: str, hash_linux: str, hash_mac_arm: str, hash_mac_intel: str, hash_windows: str, nightly: bool,
                 py_client_version: str, py_client_nightly: bool):
        self.version = version
        # If nightly, strip pre-release tag.
        self.url_version = version.split("-")[0] if nightly else version
        self.hash_linux = hash_linux
        self.hash_mac_arm = hash_mac_arm
        self.hash_mac_intel = hash_mac_intel
        self.hash_windows = hash_windows
        self.nightly = nightly
        self.py_client_version = py_client_version
        self.py_client_nightly = py_client_nightly
    
    @property
    def url(self) -> str:
        if self.nightly:
            return f"https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv{self.url_version}"
        else:
            return f"https://github.com/GlooHQ/baml/releases/download/release%2Fbaml-cli%2Fv{self.url_version}"



def update_scoop(arguments: Args) -> None:
    path = Path("baml-nightly.json" if arguments.nightly else "baml.json")
    # Read as json.
    with path.open("r") as f:
        data = json.load(f)
    data["version"] = arguments.version
    data["url"] = f"{arguments.url}/baml.exe"
    data["hash"] = arguments.hash_windows
    data["autoupdate"]["architecture"]["64bit"]["url"] = f"{arguments.url}/baml.exe"
    # Write as json.
    with path.open("w") as f:
        json.dump(data, f, indent=4)

def update_install_sh(arguments: Args) -> None:
    if arguments.nightly:
        # Don't update the install script for nightly builds.
        return
    
    path = Path("install-baml.sh")
    content = path.read_text()
    content = re.sub(r'(?<=VERSION=").*?(?=")', arguments.version, content, count=1)
    content = content.replace("# ADD CHECKSUMS HERE", f"CHECKSUMS[\"{arguments.version}\"]=( \"{arguments.hash_linux}\" \"{arguments.hash_mac_intel}\" \"{arguments.hash_mac_arm}\" )\n# ADD CHECKSUMS HERE", 1)
    content = content.replace("# ADD VERSIONS HERE", f"\"{arguments.version}\"\n# ADD VERSIONS HERE", 1)
    path.write_text(content)

def update_brew(arguments: Args) -> None:
    path = Path("Formula/baml-nightly.rb" if arguments.nightly else "Formula/baml.rb")
    name = "BamlNightly" if arguments.nightly else "Baml"
    rule = f"""
class {name} < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "{arguments.version}"

  on_macos do
    if Hardware::CPU.intel?
      url "{arguments.url}/baml-apple-intel.tar.gz"
      sha256 "{arguments.hash_mac_intel}"
    elsif Hardware::CPU.arm?
      url "{arguments.url}/baml-apple-arm.tar.gz"
      sha256 "{arguments.hash_mac_arm}"
    end
  end

  def install
    bin.install "baml"
  end
end\
"""
    path.write_text(rule)

def update_version(arguments: Args) -> None:
    path = Path("version.json")
    # Read as json.
    with path.open("r") as f:
        data = json.load(f)
    
    if arguments.version and not arguments.nightly:
        data["cli"] = arguments.version
    
    if arguments.py_client_version and not arguments.py_client_nightly:
        data["py_client"] = arguments.py_client_version
    
    # Write as json.
    with path.open("w") as f:
        json.dump(data, f, indent=4)

    
def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--version", help="new version number")
    parser.add_argument("--hash-linux", help="sha256 hash")
    parser.add_argument("--hash-mac-arm", help="sha256 hash")
    parser.add_argument("--hash-mac-intel", help="sha256 hash")
    parser.add_argument("--hash-windows", help="sha256 hash")
    # Add flag to know if its a nightly build
    parser.add_argument("--nightly", help="nightly build", action="store_true", default=False)
    parser.add_argument("--py-client-version", help="new python version number")
    parser.add_argument("--py-client-nightly", help="nightly build", action="store_true", default=False)


    args = parser.parse_args()
    arguments = Args(args.version, args.hash_linux, args.hash_mac_arm, args.hash_mac_intel, args.hash_windows, args.nightly,
                     args.py_client_version, args.py_client_nightly)

    if arguments.version:
        update_scoop(arguments)
        update_install_sh(arguments)
        update_brew(arguments)
    update_version(arguments)

if __name__ == "__main__":
    main()
