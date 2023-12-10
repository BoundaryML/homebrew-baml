
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.4.0-canary.4"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.4.0/baml-apple-intel.tar.gz"
      sha256 "f44572046b9a850e5bbde11c8f95b7fabf0beb756048c1949cdd00e393fa16e3"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.4.0/baml-apple-arm.tar.gz"
      sha256 "ad8c7636e5a6cd42051b5214e984c20a89d5400823b3dae5683059311ce4bc5d"
    end
  end

  def install
    bin.install "baml"
  end
end