class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.4768"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4768/baml-language-0.11.0-alpha.4768-aarch64-apple-darwin.tar.gz"
      sha256 "6336b298cc88a093de61c37e9686243d85f6494da91d8ea245810d868f06d926"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4768/baml-language-0.11.0-alpha.4768-x86_64-apple-darwin.tar.gz"
      sha256 "32be82cad5e9e2871dec6ccd0f618e67e728441547b083a5668fdb32bcc7b8c0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4768/baml-language-0.11.0-alpha.4768-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b83e31e6799bf4ee5a85d4f16e8e38231e51853be3f923ad93346b0ec659d690"
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
