
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.16.0-canary.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.16.0/baml-apple-intel.tar.gz"
      sha256 "515ce232338b256902077fc26bef331dd959200e651387f4d9805d579e66a787"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.16.0/baml-apple-arm.tar.gz"
      sha256 "4277fd6641258c28a9a640778041abb2157e3b907cb69972e6a38d8567bdfba0"
    end
  end

  def install
    bin.install "baml"
  end
end