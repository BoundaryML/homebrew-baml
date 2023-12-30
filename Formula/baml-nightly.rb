
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.7.0-canary.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.7.0/baml-apple-intel.tar.gz"
      sha256 "7eb290a8b98ec04d54f2bb719b96d3dd05aaca98f089d398c2b268842935a20d"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.7.0/baml-apple-arm.tar.gz"
      sha256 "2081f631bd95bd9d1657a620d37c0debf63b21c511b985b4e2ec68ec0eef0089"
    end
  end

  def install
    bin.install "baml"
  end
end