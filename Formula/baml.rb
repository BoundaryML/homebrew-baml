class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.3704"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3704/baml-language-0.11.0-alpha.3704-aarch64-apple-darwin.tar.gz"
      sha256 "1da24ae62a350128ac308bada8f34824609fe5538cfca47f45f0a3339f9e91d3"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3704/baml-language-0.11.0-alpha.3704-x86_64-apple-darwin.tar.gz"
      sha256 "c4868bc506a2fc589664563780d1c85108a4d0a2fd20deac81e5fa9510fe19e9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.3704/baml-language-0.11.0-alpha.3704-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b0dec93fe4289f771adb52b2a575930fdcc26e34da3a94d9e7d74f38b8417813"
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
