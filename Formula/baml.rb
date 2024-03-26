
class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.17.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/release%2Fbaml-cli%2Fv0.17.1/baml-apple-intel.tar.gz"
      sha256 "25d84cabc7bd87495cc05712d28396606f95d4056010e4cbc29c1ff50bbe1208"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/release%2Fbaml-cli%2Fv0.17.1/baml-apple-arm.tar.gz"
      sha256 "1639f99231e0e3d783fb792e5adbb96b21f8ef2da8a95874dfa762e1c9b8708b"
    end
  end

  def install
    bin.install "baml"
  end
end