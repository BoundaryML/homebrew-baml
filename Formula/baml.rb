class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.3774"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3774/baml-language-0.11.0-alpha.3774-aarch64-apple-darwin.tar.gz"
      sha256 "56db26b4c5d390198d0bce86530bf53c491d1e324ffa2d19074aeb1a918291d0"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3774/baml-language-0.11.0-alpha.3774-x86_64-apple-darwin.tar.gz"
      sha256 "36c4152973ffba448cda8a2fb62147d22811606669e90df3e35304e386c579d5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3774/baml-language-0.11.0-alpha.3774-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7b31b5d382705d9ed76ed5026ba7bd29767a0c71efc0256d264e8ee32db67136"
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
