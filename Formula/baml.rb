
class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.9.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/release%2Fbaml-cli%2Fv0.9.0/baml-apple-intel.tar.gz"
      sha256 "1f18f2be11cf301ef69f3e3c7b3d075ca5c34b80326e4cfbf39542e52d2603bb"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/release%2Fbaml-cli%2Fv0.9.0/baml-apple-arm.tar.gz"
      sha256 "ab6f76547ec13f8c6747462ef49866a355b9ee03f18a2cda5daadd3d401ec86e"
    end
  end

  def install
    bin.install "baml"
  end
end