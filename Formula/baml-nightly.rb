
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.3.0-canary.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.3.0/baml-apple-intel.tar.gz"
      sha256 "1528ba36f209199168dacd5d91db68580c36d83ca6c29ff3851cceb733c5b92d"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.3.0/baml-apple-arm.tar.gz"
      sha256 "d064be46bbdd1e112a1413c0d52a12f8647ba114924bb9183fc359bb6e33f307"
    end
  end

  def install
    bin.install "baml"
  end
end