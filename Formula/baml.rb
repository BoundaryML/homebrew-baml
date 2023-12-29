
class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.6.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/releases%2Fbaml-cli%2Fv0.6.1/baml-apple-intel.tar.gz"
      sha256 "ab2d4e47f5596d1784f1e75ba39a803fb88032886c81f2b9c13056a46c1fdcfd"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/releases%2Fbaml-cli%2Fv0.6.1/baml-apple-arm.tar.gz"
      sha256 "01fdfc558c4d93ad955dd709862f53f62bfa798cd0ccaa7cf9dd6f66c89db7e4"
    end
  end

  def install
    bin.install "baml"
  end
end