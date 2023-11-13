
class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.1.1-canary.14"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.1.1/baml-apple-intel.tar.gz"
      sha256 "d95b97e376d8fb16556ea07c833092656c3fc47ea593f5043b0a863615ae5145"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.1.1/baml-apple-arm.tar.gz"
      sha256 "9f4d7765ebb724d69456f7c32c97ffdc17c64c2b0097f9dbc0ce84a07333dae1"
    end
  end

  def install
    bin.install "baml"
  end
end