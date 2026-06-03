class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.4717"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4717/baml-language-0.11.0-alpha.4717-aarch64-apple-darwin.tar.gz"
      sha256 "a54c5d2097cde19b1da03ea305071f2e428d3e020c8967a7591ef5e9ac57f357"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4717/baml-language-0.11.0-alpha.4717-x86_64-apple-darwin.tar.gz"
      sha256 "af7b68cad97134d013e3844b40cdf4222887b7a07952ce207418bd7b208602ee"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4717/baml-language-0.11.0-alpha.4717-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8e262a5956e2eb2bf203d165f0d55d17761fb3d57179a34511683edb6aa1c3c0"
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
