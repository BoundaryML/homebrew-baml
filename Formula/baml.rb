
class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.18.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/release%2Fbaml-cli%2Fv0.18.0/baml-apple-intel.tar.gz"
      sha256 "f8a74f8bc6e01b44a6bee577cecc67116a2c7011db81406349de731f361de13e"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/release%2Fbaml-cli%2Fv0.18.0/baml-apple-arm.tar.gz"
      sha256 "f15d5e30c422818c85ebbfffe6bded3b495651b9472058f08fb6e3c43f5b5af2"
    end
  end

  def install
    bin.install "baml"
  end
end