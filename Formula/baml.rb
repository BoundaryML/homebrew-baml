class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.4340"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4340/baml-language-0.11.0-alpha.4340-aarch64-apple-darwin.tar.gz"
      sha256 "8e3963b816eb8741194f389ed8741a8cdcffb9641f864cdbf74e2e645791d7a8"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4340/baml-language-0.11.0-alpha.4340-x86_64-apple-darwin.tar.gz"
      sha256 "8a68bf57f2df9aaba1741436c417a91eadeccdafcaee986194b5dc1ae96b6fe9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4340/baml-language-0.11.0-alpha.4340-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "370fdef0777543af0ae4d237d81daf0fd7d7f90b7a2f03ad6f85960cc7fc7eaa"
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
