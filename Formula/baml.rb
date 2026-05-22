class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.4157"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4157/baml-language-0.11.0-alpha.4157-aarch64-apple-darwin.tar.gz"
      sha256 "c5671aeded4ab99f2fcde9a555e794cd9c1ebcd3e9c4767f7300cd9e743d82f2"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4157/baml-language-0.11.0-alpha.4157-x86_64-apple-darwin.tar.gz"
      sha256 "7dea1e12140abdf75b216f21813cd275e7c88670a35337aedca3ae0e942e3181"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4157/baml-language-0.11.0-alpha.4157-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c1ca88122abb5a355994fe194ea881141ce0f77981b0bdacdfc7c5d9e1d47935"
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
