class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.3600"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3600/baml-language-0.11.0-alpha.3600-aarch64-apple-darwin.tar.gz"
      sha256 "9fe3b28597c9ac6c255f6c5388e3a80dd78dd5e0486e4791cf89d1d516a81704"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3600/baml-language-0.11.0-alpha.3600-x86_64-apple-darwin.tar.gz"
      sha256 "9cd76e2c27ad90ae8f012beb997dc9572ad8c585f0f76bc93441e3dcb1a8cda8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3600/baml-language-0.11.0-alpha.3600-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "295d5ba39b0040b0899538d67d93c1a3f6f99c70f97f2a5c35fb5d5957027d0f"
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
