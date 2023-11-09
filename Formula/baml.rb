class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.1.1/baml-apple-intel.tar.gz"
      sha256 "2987a703b69225fced210ffcba90eaacc987d8c7002bce2db7c958742a426653"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.1.1/baml-apple-arm.tar.gz"
      sha256 "aa9ba1a5f9a516cb213495502602c52ff1c9f6b81545463d32150e4c5973a3d6"
    end
  end

  def install
    bin.install "baml"
  end
end
