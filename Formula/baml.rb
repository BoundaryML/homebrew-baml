class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.3682"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3682/baml-language-0.11.0-alpha.3682-aarch64-apple-darwin.tar.gz"
      sha256 "71fcb97ba3f5833ecd40f66e5a7dc4d7e2da1ba1654a5c0ee310e7fcc7301f8d"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3682/baml-language-0.11.0-alpha.3682-x86_64-apple-darwin.tar.gz"
      sha256 "b194059be65584245652089a7d68ecea51967d3367a834f9899877f645b1754b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3682/baml-language-0.11.0-alpha.3682-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5555fbb06f20f3627fb293c0d3e06a53508a52105fec3fb68bf2f60079047025"
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
