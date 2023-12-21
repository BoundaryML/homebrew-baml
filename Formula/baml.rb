
class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.5.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/releases%2Fbaml-cli%2Fv0.5.0/baml-apple-intel.tar.gz"
      sha256 "268b0f000e452ab729bdde40e15bf120239c176a038fb0796bd1b444d74fe784"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/releases%2Fbaml-cli%2Fv0.5.0/baml-apple-arm.tar.gz"
      sha256 "2b87c6fdeb558ee90df269da0d32e985ee7bb93bcca8bb7c88d0e2585c66270f"
    end
  end

  def install
    bin.install "baml"
  end
end