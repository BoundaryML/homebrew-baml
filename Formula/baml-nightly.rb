
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.10.0-canary.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.10.0/baml-apple-intel.tar.gz"
      sha256 "5b29362a493d9081302d8fb20e3679fe884236cbdd42951d4a9981356e388fca"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.10.0/baml-apple-arm.tar.gz"
      sha256 "d662605fd67c06d945b4295888f1e1210f06ded05b9ba220e447f63d330a5d02"
    end
  end

  def install
    bin.install "baml"
  end
end