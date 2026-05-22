class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.4166"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4166/baml-language-0.11.0-alpha.4166-aarch64-apple-darwin.tar.gz"
      sha256 "7f89c108f6e5736aafd768bc46022d167af9cfe87a78bdf1b49f5d2c9fc8efc3"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4166/baml-language-0.11.0-alpha.4166-x86_64-apple-darwin.tar.gz"
      sha256 "a10b10100809b780c98da645667cbc1b3d31d25d71bda1105979492e0c54fa93"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4166/baml-language-0.11.0-alpha.4166-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "35816a1493a36758cd67193fda0738415d52b5edf7d921932dbd389f1b82c335"
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
