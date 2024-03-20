
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.14.0-canary.4"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.14.0/baml-apple-intel.tar.gz"
      sha256 "323286dbf9e614e12d48d3c95a1304a12e858ff9421e74da8f53be656a809ec8"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.14.0/baml-apple-arm.tar.gz"
      sha256 "70d8da4531a88e0ceb50290287dcd6ca87ce1c02ae209239ce97db7eb4775b2d"
    end
  end

  def install
    bin.install "baml"
  end
end