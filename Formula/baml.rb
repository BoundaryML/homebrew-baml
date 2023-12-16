
class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.4.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/releases%2Fbaml-cli%2Fv0.4.3/baml-apple-intel.tar.gz"
      sha256 "73fd54c8ed26f10655c25340768349e556fd336c309aaa82c2e9d50e2da476c4"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/releases%2Fbaml-cli%2Fv0.4.3/baml-apple-arm.tar.gz"
      sha256 "230d638b6282acaaf3f27c75098e53add7ef5d11c9de93c50c1717d83d7433fb"
    end
  end

  def install
    bin.install "baml"
  end
end