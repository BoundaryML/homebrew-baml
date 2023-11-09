class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.1.1/baml-apple-intel.tar.gz"
      sha256 "7aa8b1349aaa9777b2e2eabe5cc982b59f18560e255a23a3476d931f83de71b0"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.1.1/baml-apple-arm.tar.gz"
      sha256 "72a88dae8a7dd3e0e25a612b2099fe29d32f999ff201c46a8a0f54bac83b54c0"
    end
  end

  def install
    bin.install "baml"
  end
end
