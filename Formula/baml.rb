class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.3609"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3609/baml-language-0.11.0-alpha.3609-aarch64-apple-darwin.tar.gz"
      sha256 "ab46aa941187715d4cf49dbd30d8787a7d01fb74e97ce739d52c349999a6fd8d"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3609/baml-language-0.11.0-alpha.3609-x86_64-apple-darwin.tar.gz"
      sha256 "dea8b2b0ea2219bb4a59834fc40b1713fa20b57a03f33df22a4c4ed9e374dfb2"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3609/baml-language-0.11.0-alpha.3609-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "66ad3282f6c871e43cd1e87e87e30970e35b52acc0b9fce4670c4b66fc022b03"
    else
      odie "BAML alpha Homebrew builds currently support Linux x86_64 only"
    end
  end

  def install
    bin.install "baml-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/baml-cli --version")
  end
end
