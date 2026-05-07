class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.3717"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3717/baml-language-0.11.0-alpha.3717-aarch64-apple-darwin.tar.gz"
      sha256 "9804b3795c43dd82d6b42ff57e8df9edadc48b424ac7d1e6fe285fe6636a73b1"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3717/baml-language-0.11.0-alpha.3717-x86_64-apple-darwin.tar.gz"
      sha256 "13ccc861b1671da1b6f735678c888e614e26b59593ce33e2331c870cffdd9277"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3717/baml-language-0.11.0-alpha.3717-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "23c43f546d14d898d01cba0eacdfcfa4cfd254c81a703ec8c9dcc0942b3ea1b7"
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
