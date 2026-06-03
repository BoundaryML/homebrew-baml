class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.4726"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4726/baml-language-0.11.0-alpha.4726-aarch64-apple-darwin.tar.gz"
      sha256 "26ec1074f7178fa90fe0798dc925938ca96a89392e79b21a612d7c13bfcf0305"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4726/baml-language-0.11.0-alpha.4726-x86_64-apple-darwin.tar.gz"
      sha256 "4174a4a64d8d193a3c6ec76007146882437892ef8b5b3a2944a6e7a4e1d17ebe"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4726/baml-language-0.11.0-alpha.4726-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "21a3eddc8915b1a426a96bb9efa4f2f3aa3e7d5fbb40ad114e27c2bc3101576f"
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
