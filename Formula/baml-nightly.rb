
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.3.0-canary.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.3.0/baml-apple-intel.tar.gz"
      sha256 "10a92cb291a54723f5fffd515389f31eb6aec69be00aab081e331ef08a563d97"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.3.0/baml-apple-arm.tar.gz"
      sha256 "142e48d7da0a86466c4e2304210e7c63a56db128765ed3bfaad567d8c0f468d5"
    end
  end

  def install
    bin.install "baml"
  end
end