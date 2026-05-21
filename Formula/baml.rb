class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.4110"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4110/baml-language-0.11.0-alpha.4110-aarch64-apple-darwin.tar.gz"
      sha256 "5ef0ecfc52096dda51a2e170404ec0947cec6477c7a401e548a70962cacad7c5"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4110/baml-language-0.11.0-alpha.4110-x86_64-apple-darwin.tar.gz"
      sha256 "782dbdca2a892278671c5f5d85e00c284cc1f5597ff7c3a6d380e48da7af5918"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4110/baml-language-0.11.0-alpha.4110-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "39913715e39d2e86561f1bddb537a4085e053ebd4c87c644baaefaaf70324ec9"
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
