
class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/releases%2Fbaml-cli%2Fv0.2.0/baml-apple-intel.tar.gz"
      sha256 "5d45ba13442c2766f594fe9796ff209c91187554d827b6cfaf78f91bb6ce95e2"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/releases%2Fbaml-cli%2Fv0.2.0/baml-apple-arm.tar.gz"
      sha256 "da466592458b0bc529d16f9d71e16c4a23c11765bbc1ee1a7549c16ec8e27e23"
    end
  end

  def install
    bin.install "baml"
  end
end