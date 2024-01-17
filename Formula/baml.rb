
class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.8.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/release%2Fbaml-cli%2Fv0.8.1/baml-apple-intel.tar.gz"
      sha256 "a2777c7efe08d2a6f4120eb07fa153c3b63b7f3bbdd0f8410e3c6d3461a7cb46"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/release%2Fbaml-cli%2Fv0.8.1/baml-apple-arm.tar.gz"
      sha256 "32c3d8fa6d6de10a3c1df7095f088944680cce32a66db363bf9a843ccf52c05b"
    end
  end

  def install
    bin.install "baml"
  end
end