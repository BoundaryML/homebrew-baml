
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.5.0-canary.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.5.0/baml-apple-intel.tar.gz"
      sha256 "b869b0bbfd9d5180f8b07db4ce732c1e7c64a6b1f4d427959236af45e9c89bae"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.5.0/baml-apple-arm.tar.gz"
      sha256 "6b8b9fe3bda18d65fd8c2d354f4b90f6b16c07625f35c3093c64fb4212725038"
    end
  end

  def install
    bin.install "baml"
  end
end