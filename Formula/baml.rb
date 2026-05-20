class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.4062"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4062/baml-language-0.11.0-alpha.4062-aarch64-apple-darwin.tar.gz"
      sha256 "ce4843762e7fe9416bc0c41d003e03c412c8c066298540e0683a7647e041e5cf"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4062/baml-language-0.11.0-alpha.4062-x86_64-apple-darwin.tar.gz"
      sha256 "4dce93b32a33e7a46546f735bbe58805d732a684c80e0ebf4728c7b614c5584d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4062/baml-language-0.11.0-alpha.4062-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a6b899d22ca151a169f0039d1dd68a8ec2b795eb5ed19a70ad207f713bc2fa07"
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
