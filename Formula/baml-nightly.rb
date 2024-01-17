
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.9.0-canary.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.9.0/baml-apple-intel.tar.gz"
      sha256 "e7670f367b576479e116b6d7c0311aec43b77f0750f4151e69938000513217d4"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.9.0/baml-apple-arm.tar.gz"
      sha256 "5d35bdb191ed7d43306d7255be1c90b5d04e145c0686d369a2402d092e304ffa"
    end
  end

  def install
    bin.install "baml"
  end
end