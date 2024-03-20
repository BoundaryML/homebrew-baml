
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.14.0-canary.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.14.0/baml-apple-intel.tar.gz"
      sha256 "338cc9d0cc65736a2a03e7485a9bf466097a43e68489e43ea71471f81f2b44f5"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.14.0/baml-apple-arm.tar.gz"
      sha256 "6d1c4da94596a388c39792e28ce95a3fe15a1fafc565624843f4d6243ef947c9"
    end
  end

  def install
    bin.install "baml"
  end
end