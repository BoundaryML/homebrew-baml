class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.3576"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3576/baml-language-0.11.0-alpha.3576-aarch64-apple-darwin.tar.gz"
      sha256 "a701ec2213a3acc915253a42d43fddef71d552daa660c0a1ac76381d2c8e749a"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3576/baml-language-0.11.0-alpha.3576-x86_64-apple-darwin.tar.gz"
      sha256 "d52e80c28e548838773dfb2fbf17e55b4b4aa084faeee01c1223e6a4e7359825"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3576/baml-language-0.11.0-alpha.3576-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "34625219911e2c8792e6394086f369f375d2e59f061173ddb257e1222fca354f"
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
