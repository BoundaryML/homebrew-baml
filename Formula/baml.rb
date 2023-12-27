
class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.6.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/releases%2Fbaml-cli%2Fv0.6.0/baml-apple-intel.tar.gz"
      sha256 "7aa59caa2594f566ffdb706b0fc000a0051ef92e6f6d67544c0677d612a6d32b"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/releases%2Fbaml-cli%2Fv0.6.0/baml-apple-arm.tar.gz"
      sha256 "f7e60b9a995ba22182428c526231d33eac03b2cdc856dce53cb06fbb7352d00a"
    end
  end

  def install
    bin.install "baml"
  end
end