
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.8.0-canary.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.8.0/baml-apple-intel.tar.gz"
      sha256 "b098ffe9329924354104babf8f06ef700900e0019fe3f47b58afa6e74db4bf69"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.8.0/baml-apple-arm.tar.gz"
      sha256 "6570d17306cbcd89bd0f846c8ebbf489591ae0eaa66bf835df788b08d93f4946"
    end
  end

  def install
    bin.install "baml"
  end
end