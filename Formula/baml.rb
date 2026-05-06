class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.3676"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3676/baml-language-0.11.0-alpha.3676-aarch64-apple-darwin.tar.gz"
      sha256 "b80eafdc9e87617ea4d84ee98e05ebd4512dba1605cb8a2612c75736299d7d2c"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3676/baml-language-0.11.0-alpha.3676-x86_64-apple-darwin.tar.gz"
      sha256 "a5c26d79542a00a47076d36e2a1730cd4cb935017ca5416fb898959b239dfdd8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3676/baml-language-0.11.0-alpha.3676-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bdb2d826da1ec1658d5bd7c6a70751b516fde7a0f336d4c645d161b0baca8646"
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
