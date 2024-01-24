
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.9.0-canary.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.9.0/baml-apple-intel.tar.gz"
      sha256 "e1739bbff171e20da26eab0995c9a262f9269dd014cf03b0e86a571dba9567aa"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.9.0/baml-apple-arm.tar.gz"
      sha256 "7baf7001e4ec1de9faad38ba20df1dae16f5b9faf4f38849395f0638fa63eca2"
    end
  end

  def install
    bin.install "baml"
  end
end