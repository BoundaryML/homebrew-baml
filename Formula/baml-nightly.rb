
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.14.0-canary.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.14.0/baml-apple-intel.tar.gz"
      sha256 "61da325b432b70de5f728cc366e3aad0ca2b9c23b29290abec00fa1b469ce2a9"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.14.0/baml-apple-arm.tar.gz"
      sha256 "d687fe55435d96d6afe18b2c5f62b730f7d977086025e103bc005c3e847f5893"
    end
  end

  def install
    bin.install "baml"
  end
end