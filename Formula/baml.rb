class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.3642"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3642/baml-language-0.11.0-alpha.3642-aarch64-apple-darwin.tar.gz"
      sha256 "52d877e4193e46b985bb1c25fe08f5857f61dd71d43c8384b873e0d1acb4c321"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3642/baml-language-0.11.0-alpha.3642-x86_64-apple-darwin.tar.gz"
      sha256 "d7507400c671d0a99297480d1349b88e80418487acf959b0bfe9f6c28e2f8cda"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3642/baml-language-0.11.0-alpha.3642-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d5638d5fecb9ab1c9d56a95f54638ff8fa93de422043144eb5b3aed97b3a45bb"
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
