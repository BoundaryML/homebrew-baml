
class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.1.1-canary.15"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.1.1/baml-apple-intel.tar.gz"
      sha256 "4670cf92cb66280fe983afab5d3abd9496c3d85f6ef58f9ff0de36b04d7f5ed8"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.1.1/baml-apple-arm.tar.gz"
      sha256 "a1bc575118139d48d17431de8fb36e9fd7d1011818b61bbe64cc07f986cd33f2"
    end
  end

  def install
    bin.install "baml"
  end
end