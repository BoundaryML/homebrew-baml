
class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/releases%2Fbaml-cli%2Fv0.4.0/baml-apple-intel.tar.gz"
      sha256 "529d3afb571dbf0be0b10e881520525b73868e2da1376a152ac0aebb6e18c349"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/releases%2Fbaml-cli%2Fv0.4.0/baml-apple-arm.tar.gz"
      sha256 "89a2f8db93e3165224298adbd2ce1f29323a0369fc9ae9648d712186ca164e33"
    end
  end

  def install
    bin.install "baml"
  end
end