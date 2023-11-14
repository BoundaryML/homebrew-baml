
class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.2.1-canary.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.2.1/baml-apple-intel.tar.gz"
      sha256 "1712f448725d42ea86328a6907488a3bbefcc0475a440a59fe6db827107a7a73"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.2.1/baml-apple-arm.tar.gz"
      sha256 "384d88d7b0f23e1200666eecd9f43809f572fa0962eb1edb3a3d5779cc8a9c22"
    end
  end

  def install
    bin.install "baml"
  end
end