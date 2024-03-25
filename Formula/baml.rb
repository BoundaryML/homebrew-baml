
class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.16.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/release%2Fbaml-cli%2Fv0.16.0/baml-apple-intel.tar.gz"
      sha256 "5271b12c5f4c8e5f0d589ec8f328fc384b88a3bf0f888846632118edcbfa6d98"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/release%2Fbaml-cli%2Fv0.16.0/baml-apple-arm.tar.gz"
      sha256 "5b31d6e92731f99d923250645a1225083e27f1b5647ff570b3f9e584b52a4bea"
    end
  end

  def install
    bin.install "baml"
  end
end