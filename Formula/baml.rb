class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.3871"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3871/baml-language-0.11.0-alpha.3871-aarch64-apple-darwin.tar.gz"
      sha256 "71fab50b2ac62084ba16eaf75efe14b822c681a12abbb27655f9456ca5763c93"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3871/baml-language-0.11.0-alpha.3871-x86_64-apple-darwin.tar.gz"
      sha256 "a3092c0b1ff40234c177d8fe15120aebca80ca8da65973ccc2cbe9a9f09ec478"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3871/baml-language-0.11.0-alpha.3871-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b2d4f0b2bd967c40fef4d2b21241126334bf84296b90b4814fc873a2c6db042a"
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
