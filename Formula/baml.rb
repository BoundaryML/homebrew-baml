
class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.7.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/releases%2Fbaml-cli%2Fv0.7.0/baml-apple-intel.tar.gz"
      sha256 "9f3f65f6ef69cbeb52423d799364e0a2e4f16d1cb4b5fd62b7d21f7ff78628a1"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/releases%2Fbaml-cli%2Fv0.7.0/baml-apple-arm.tar.gz"
      sha256 "9fddc0e6e6368b732528b283e4e6b6c7991019e45f90683495d1cec917ef7b5c"
    end
  end

  def install
    bin.install "baml"
  end
end