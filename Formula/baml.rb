class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.4335"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4335/baml-language-0.11.0-alpha.4335-aarch64-apple-darwin.tar.gz"
      sha256 "8c63416f75daff41a6022489b39f9b70b094ac5f316de47792796e0d9c9f93a8"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4335/baml-language-0.11.0-alpha.4335-x86_64-apple-darwin.tar.gz"
      sha256 "f80c154a9aed4ae1b7fc57e3e7144877067b0b427a771711de5df7ce76735952"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4335/baml-language-0.11.0-alpha.4335-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "54a836776daadd8ec7fc097ce121dd2ccbd5d3807903055723c21fd745bdca1a"
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
