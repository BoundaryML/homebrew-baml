class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "0.11.0-alpha.4077"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4077/baml-language-0.11.0-alpha.4077-aarch64-apple-darwin.tar.gz"
      sha256 "c4a20729e298233a4857b4d5fb66d92b749be4ca93b4212e26dd235fe90fcc2f"
    elsif Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4077/baml-language-0.11.0-alpha.4077-x86_64-apple-darwin.tar.gz"
      sha256 "c03f6d0ec606b219d7ba572720176bac5a2adfbd0a7cbc1ea9e8e8268c3d91b6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BoundaryML/baml/releases/download/baml-language-0.11.0-alpha.4077/baml-language-0.11.0-alpha.4077-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "46ece5a3be4ab77f312633cdd106904cc8af27ec1c475a393c54672f22febbac"
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
