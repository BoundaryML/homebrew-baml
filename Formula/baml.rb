class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.4734"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4734/baml-language-0.11.0-alpha.4734-aarch64-apple-darwin.tar.gz"
      sha256 "567d056773a8c2eb377eee4f47eb7e0921a5897a5ba900945287c4b0a65923b9"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4734/baml-language-0.11.0-alpha.4734-x86_64-apple-darwin.tar.gz"
      sha256 "302548a5c41787d1788b497bea4aa4a8c9742587cf3a872c61597f0d8e38ad48"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4734/baml-language-0.11.0-alpha.4734-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1a28bf03b16152379f693e2fd0cb64ca5581c5258f63f306328c95d1250e6e80"
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
