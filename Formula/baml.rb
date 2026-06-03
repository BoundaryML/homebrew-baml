class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.4776"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4776/baml-language-0.11.0-alpha.4776-aarch64-apple-darwin.tar.gz"
      sha256 "2505a4303585779f0dea9206fc819cf84dafe679b7f521f939a7028f41f2b315"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4776/baml-language-0.11.0-alpha.4776-x86_64-apple-darwin.tar.gz"
      sha256 "b8acceeae52fd4e91937b329bf56eb1820c0bab2337a16c675a6bff1e12d5ac1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4776/baml-language-0.11.0-alpha.4776-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fb3a6aecc75ee0fa5a4fec54c7f8962436abd57c171f05dd1cfbae2a6694ae93"
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
