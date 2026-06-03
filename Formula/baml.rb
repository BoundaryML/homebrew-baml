class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.4723"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4723/baml-language-0.11.0-alpha.4723-aarch64-apple-darwin.tar.gz"
      sha256 "f31e583f42ba4ecead3e354eab049f0888a6ec6b32b9577885f7f47b9293adec"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4723/baml-language-0.11.0-alpha.4723-x86_64-apple-darwin.tar.gz"
      sha256 "f71c3a2304a9be46854477040b6c3ca6916209fc6cb3415bc3080cb1e7d58639"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4723/baml-language-0.11.0-alpha.4723-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4e8a1e0aa0cf8a9c848d2e7dd3dc774b678f8fdcea6c2aba663f9af118a3e47f"
    else
      odie "BAML alpha Homebrew builds currently support Linux x86_64 only"
    end
  end

  def install
    bin.install "baml-cli" => "baml"
    bin.install_symlink "baml" => "baml-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/baml --version")
    assert_match version.to_s, shell_output("#{bin}/baml-cli --version")
  end
end
