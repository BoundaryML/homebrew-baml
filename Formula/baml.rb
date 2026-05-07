class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.3727"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3727/baml-language-0.11.0-alpha.3727-aarch64-apple-darwin.tar.gz"
      sha256 "62ba1775a76ee9c0db474db435de001f90611150d02bed4a564c198a4ecf26f4"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3727/baml-language-0.11.0-alpha.3727-x86_64-apple-darwin.tar.gz"
      sha256 "dfbeb9781f494d5907fbd7f0d4f3860ce2e7d4da52e14194dc562a9ff8c78ed2"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3727/baml-language-0.11.0-alpha.3727-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d715ec7b6216a44eb360a72fc44f6c17ec7b1cbfbc32c03637876ed1c6313d7c"
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
