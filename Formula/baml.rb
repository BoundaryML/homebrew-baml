class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.4744"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4744/baml-language-0.11.0-alpha.4744-aarch64-apple-darwin.tar.gz"
      sha256 "9eca58c2a1c683838a48c53aab8e3601d333caa06c484288755d66fcdfec05ed"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4744/baml-language-0.11.0-alpha.4744-x86_64-apple-darwin.tar.gz"
      sha256 "52d505e3519ed48229afd578fe62026966ebe4f0ede17660e14d5c50f3ce4caf"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4744/baml-language-0.11.0-alpha.4744-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cc509af0b276e9fad96b5a30bd859f8e043aa6ffff163aab87858ca1d15cf273"
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
