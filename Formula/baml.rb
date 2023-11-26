
class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/releases%2Fbaml-cli%2Fv0.3.0/baml-apple-intel.tar.gz"
      sha256 "f6950b974f7160acb080f1dd8a7634625bf994ecec802c20843388db9e064276"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/releases%2Fbaml-cli%2Fv0.3.0/baml-apple-arm.tar.gz"
      sha256 "5273d1c9240f5d32f5881afd0cf67072b5d1bd11beebb819ca7fb1ea649b401a"
    end
  end

  def install
    bin.install "baml"
  end
end