class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.4049"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4049/baml-language-0.11.0-alpha.4049-aarch64-apple-darwin.tar.gz"
      sha256 "45511b970a02a301ca89f8dcbe4ebe760b8305e2428ff83ce103c780e7afd69f"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4049/baml-language-0.11.0-alpha.4049-x86_64-apple-darwin.tar.gz"
      sha256 "bd1578cd9a3e489ddd46c4ce377020ab026b5b7439efe67e99335f32117e9d32"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4049/baml-language-0.11.0-alpha.4049-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d9babd524f0babe84e9d80fadc8190bd1d7ee7a51d91f3772c2d99ca2ad216de"
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
