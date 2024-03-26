
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.18.0-canary.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.18.0/baml-apple-intel.tar.gz"
      sha256 "d95b6c64e64b8443c601adf9134916507f88fcb97a98eba6479433a57f7f1e0c"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.18.0/baml-apple-arm.tar.gz"
      sha256 "e4b18a0f2fea85665227105dd1654270f505fcd94e4c064f1f14ad8afb282931"
    end
  end

  def install
    bin.install "baml"
  end
end