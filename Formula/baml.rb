class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.4780"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4780/baml-language-0.11.0-alpha.4780-aarch64-apple-darwin.tar.gz"
      sha256 "c9d63c6ef0d087864a6e5ee10ecd2d34413a98e1c119f2baa3f34032a5f9161e"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4780/baml-language-0.11.0-alpha.4780-x86_64-apple-darwin.tar.gz"
      sha256 "61bb2d08e1e5da455e3c202c7f1b542bb1cfc59e386e6cb12833f5142b0ad643"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4780/baml-language-0.11.0-alpha.4780-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "04255efbdbe1777ea1c2169fc8a8b62c394c4203a2970914a0d958dfa5a6bdb2"
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
