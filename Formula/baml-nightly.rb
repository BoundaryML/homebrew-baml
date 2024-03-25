
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.17.0-canary.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.17.0/baml-apple-intel.tar.gz"
      sha256 "dae64b486530aea0c06a1314190bafab84c09734fd083dcd16f423a0f68a06f1"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.17.0/baml-apple-arm.tar.gz"
      sha256 "134592b6fca6afcf7bb36719bf01d8f6bd07238917b1c916fd9af8fe2f588ecd"
    end
  end

  def install
    bin.install "baml"
  end
end