class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.4753"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4753/baml-language-0.11.0-alpha.4753-aarch64-apple-darwin.tar.gz"
      sha256 "d5f0ef40cc74c8cd129b2906a3f532d36d2c418f8d7c678ebe70192a518df507"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4753/baml-language-0.11.0-alpha.4753-x86_64-apple-darwin.tar.gz"
      sha256 "6376637db7fab8f2a38a84d2894b33bbd3d04234eb8812c84d760c25dcecd5d4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4753/baml-language-0.11.0-alpha.4753-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bbe52ee5c883f052f77edb53a79cc89061f937168b870f68cd98fb99e93198ad"
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
