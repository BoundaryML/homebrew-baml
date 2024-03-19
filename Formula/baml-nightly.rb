
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.14.0-canary.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.14.0/baml-apple-intel.tar.gz"
      sha256 "897be9ded072e78d4317d947f8778ebd1ea5c0718e63218187694bc86bc61e42"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.14.0/baml-apple-arm.tar.gz"
      sha256 "fe7e3924e2b5d09e1b802381e184f0218b2ba412a33f7cc88f5fdfba53ea4ec8"
    end
  end

  def install
    bin.install "baml"
  end
end