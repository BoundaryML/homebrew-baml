
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.6.0-canary.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.6.0/baml-apple-intel.tar.gz"
      sha256 "3e895c0b5db0637f659b57ffc2903c4215ac1b742083334543a45e2b7d2b7c69"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.6.0/baml-apple-arm.tar.gz"
      sha256 "82896358944a828367c48175d637331ad1ed214f0766f020b648968e7f150b2e"
    end
  end

  def install
    bin.install "baml"
  end
end