class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.4116"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4116/baml-language-0.11.0-alpha.4116-aarch64-apple-darwin.tar.gz"
      sha256 "1e9e34ce6dd58ac73852f42a4b0bf51f7c64e248d76eb458b433c4ec926f4d7d"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4116/baml-language-0.11.0-alpha.4116-x86_64-apple-darwin.tar.gz"
      sha256 "ce7d60f1241e3f81947288294a4ad796dcd0b26ec3ff44bb2e2b6a0cd30a86a5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4116/baml-language-0.11.0-alpha.4116-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "35691dfa9c94820f60b2979f2351bea3d7ac6eb00f7ec301c77b1125ee508ad7"
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
