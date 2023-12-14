
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.4.0-canary.6"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.4.0/baml-apple-intel.tar.gz"
      sha256 "46265bdc78639613c52f10128a9e9edad62ce7f5f7d3d314a84f60c50034038a"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.4.0/baml-apple-arm.tar.gz"
      sha256 "4b694dc7ab8d844dc41c29505a390fe258b3d117b814910e1384840342efd443"
    end
  end

  def install
    bin.install "baml"
  end
end