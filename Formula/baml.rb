
class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.4.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/releases%2Fbaml-cli%2Fv0.4.1/baml-apple-intel.tar.gz"
      sha256 "b87ae5b342d2dca38410dfe1c0e051d844e78f31ce3d9c5371039f92859e3fb8"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/releases%2Fbaml-cli%2Fv0.4.1/baml-apple-arm.tar.gz"
      sha256 "aeffbd22bcfdcf89a6de9173434e9ca9c315fa3c96cdc3dac2797374fc478e8e"
    end
  end

  def install
    bin.install "baml"
  end
end