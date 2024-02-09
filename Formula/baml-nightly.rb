
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.12.0-canary.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.12.0/baml-apple-intel.tar.gz"
      sha256 "a588f82e2afcf633696bca26c37b5371f0323ca9f02f9f7362e79e11f4dbfb08"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.12.0/baml-apple-arm.tar.gz"
      sha256 "a82c097fdcee1c2715f0151ddc83e465e68281c1fa1ed4ce3f9e4f94daa558f7"
    end
  end

  def install
    bin.install "baml"
  end
end