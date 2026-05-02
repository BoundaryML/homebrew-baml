class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.3588"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3588/baml-language-0.11.0-alpha.3588-aarch64-apple-darwin.tar.gz"
      sha256 "0450a401f3d570eed8bf12d6e34be45ae46d5b0de9f641a785a7e16d708404d9"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3588/baml-language-0.11.0-alpha.3588-x86_64-apple-darwin.tar.gz"
      sha256 "baf83b5365b8855681de10d47c49131e82d2fd26d5ebd8ed6f12364437f52816"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3588/baml-language-0.11.0-alpha.3588-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6c59abd946dc41902f121080225f8beff133692e87ee69abd8ef74699a2684a4"
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
