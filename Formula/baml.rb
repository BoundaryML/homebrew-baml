class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.4053"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4053/baml-language-0.11.0-alpha.4053-aarch64-apple-darwin.tar.gz"
      sha256 "ee5816a5c7073895765c37a2882a1adcb39d6132ce7ed8f3967badcbc7bf616b"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4053/baml-language-0.11.0-alpha.4053-x86_64-apple-darwin.tar.gz"
      sha256 "8240d82d0fce3c5efed6c327ca2cf34cd016e4489368f620d012e6a1bb0ed4b1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4053/baml-language-0.11.0-alpha.4053-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "51e7100d3d9f5425366cace7c21b667a4d25327440927fa7e0126263c9907715"
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
