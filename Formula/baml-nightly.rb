
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.4.0-canary.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.4.0/baml-apple-intel.tar.gz"
      sha256 "1753630f1bd0d50b0691560746766a40c9f17131209186cc95e242b8ed58a71e"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.4.0/baml-apple-arm.tar.gz"
      sha256 "18c48addeee8f2528d80df0a7c8b6a106023816e28a708bf3747000baf6deb10"
    end
  end

  def install
    bin.install "baml"
  end
end