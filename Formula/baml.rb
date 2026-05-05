class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.3622"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3622/baml-language-0.11.0-alpha.3622-aarch64-apple-darwin.tar.gz"
      sha256 "8a6fa819f2e250613266ddc54c4de9b656e0d11bae17546b1d71f40911104274"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3622/baml-language-0.11.0-alpha.3622-x86_64-apple-darwin.tar.gz"
      sha256 "3d0d26ad3de527ff007c48b3ced5d0960ae0328024a8fd13adc1efb5131c670b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3622/baml-language-0.11.0-alpha.3622-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c6a18557ce4b7fd4241fd926fe8736e1fed52ce9c7d4b4d22f7f13976b4244f7"
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
