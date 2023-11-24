
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.2.1-canary.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.2.1/baml-apple-intel.tar.gz"
      sha256 "4a5cc3aee0a21002254d0821502e0d589ca02f3c6c107bae3c4c2e3557563348"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.2.1/baml-apple-arm.tar.gz"
      sha256 "2e755df24aa0bb2d7660637e685998e5cc992e28438f461949f4714b9014c246"
    end
  end

  def install
    bin.install "baml"
  end
end