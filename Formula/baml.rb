class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.4738"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4738/baml-language-0.11.0-alpha.4738-aarch64-apple-darwin.tar.gz"
      sha256 "f472d39b180006f3cfd963987180ca32482c377e6c641b2064713bd84c01622b"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4738/baml-language-0.11.0-alpha.4738-x86_64-apple-darwin.tar.gz"
      sha256 "a9c3ddef133180a892a6285c5f629623a826ccf9ba1fee5e395ad0acaa8d3824"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4738/baml-language-0.11.0-alpha.4738-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7a10c45aad02c3c5b778c34ee11431766f5a3639d22fc7e572679fed21fb8c92"
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
