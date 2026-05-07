class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.3767"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3767/baml-language-0.11.0-alpha.3767-aarch64-apple-darwin.tar.gz"
      sha256 "d18c6da15b547c5bb4184a9b6c1b06cc4578a43df36b7189b1a5bc7565e24913"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3767/baml-language-0.11.0-alpha.3767-x86_64-apple-darwin.tar.gz"
      sha256 "53047432de3b37af37d2975e86ca3f351f7398660162212639ea2a8ab5b95825"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3767/baml-language-0.11.0-alpha.3767-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bd62321b2ce2194c49678fa4f14f9333faa100f01f9a75680159b1e8576e8820"
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
