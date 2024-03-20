
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.15.0-canary.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.15.0/baml-apple-intel.tar.gz"
      sha256 "34912fa08fa42a9041efa7133e7249e1ab8a75a7e683eaf4401d4178b6b86aec"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.15.0/baml-apple-arm.tar.gz"
      sha256 "34a0e0f55f5264e8deb199623aacece74a7cb86e761830eb36d46fb8a0165c06"
    end
  end

  def install
    bin.install "baml"
  end
end