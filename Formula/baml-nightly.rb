
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.19.0-canary.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.19.0/baml-apple-intel.tar.gz"
      sha256 "dd8cad9b84d95a14c5cf85e3fa608178d782f278274f5f40a215cc21fdb7c1a4"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.19.0/baml-apple-arm.tar.gz"
      sha256 "e2cac238e5043b721acd2322f580a18ab1658f11c9f76d5e4c3a803caa8bb4b9"
    end
  end

  def install
    bin.install "baml"
  end
end