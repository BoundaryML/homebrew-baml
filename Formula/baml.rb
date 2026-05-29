class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.4383"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4383/baml-language-0.11.0-alpha.4383-aarch64-apple-darwin.tar.gz"
      sha256 "92938eeef696e185d74327d8d362530c68d0549383729b8a66eb40f3d406b06b"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4383/baml-language-0.11.0-alpha.4383-x86_64-apple-darwin.tar.gz"
      sha256 "1413712495c610e8e3896b80f0a785a8a2da655f5c01e32301b05cdf577d168b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4383/baml-language-0.11.0-alpha.4383-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c404ab99789178232a0f8cbed749572744eced8e6c6c75377755a5ea4a5326f8"
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
