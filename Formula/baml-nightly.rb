
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.12.0-canary.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.12.0/baml-apple-intel.tar.gz"
      sha256 "61fc37ac072e8cb2b37a2e2c0fc0b6c03953436571c6a8f26042b9faed89fc72"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.12.0/baml-apple-arm.tar.gz"
      sha256 "7dde87ee903c9c8a15e63d828664875bb7b3b0593cf24c71c61cf865e4dd210f"
    end
  end

  def install
    bin.install "baml"
  end
end