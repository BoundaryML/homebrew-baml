class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.4112"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4112/baml-language-0.11.0-alpha.4112-aarch64-apple-darwin.tar.gz"
      sha256 "0fc1e6cc7e2e51a612f3c76484e856e1ebde4abbff793886964fc880193ad532"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4112/baml-language-0.11.0-alpha.4112-x86_64-apple-darwin.tar.gz"
      sha256 "abb92632b1998e485eacf55e719e644c3c45fe92d9bdcb1c942fab8eaacda5e9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4112/baml-language-0.11.0-alpha.4112-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "384a991a52cb4e035562de2a6612c867799f88fd091a2bd30b791ac87087c09d"
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
