class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.4281"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4281/baml-language-0.11.0-alpha.4281-aarch64-apple-darwin.tar.gz"
      sha256 "98905877c4993ee3eb34d0932aa5b4b480fcbde0d954a2d299453344ed5a0957"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4281/baml-language-0.11.0-alpha.4281-x86_64-apple-darwin.tar.gz"
      sha256 "741fa577e3243633c1b4cb65cd81665cfcd3caa4bf7a81706bb58eb0007d7992"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4281/baml-language-0.11.0-alpha.4281-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "39882dd5cad860dda97902280c76cf9bb31be27615f2d72ecc6b58aefc3e1965"
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
