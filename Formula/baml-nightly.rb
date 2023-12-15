
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.4.0-canary.7"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.4.0/baml-apple-intel.tar.gz"
      sha256 "011c525c91df04bac197ce9b5233c44de1b18358b79559643cffe1c4ee804c89"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.4.0/baml-apple-arm.tar.gz"
      sha256 "55a93b315fd4b12018e01941ccec6a48011b15a778459ebead9cd0c4de264d94"
    end
  end

  def install
    bin.install "baml"
  end
end