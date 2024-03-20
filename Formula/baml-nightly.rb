
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.14.0-canary.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.14.0/baml-apple-intel.tar.gz"
      sha256 "70321fcfa5b8c1abd2274d3384a21512ad27e82a595a22d4c50d3addda083cf0"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.14.0/baml-apple-arm.tar.gz"
      sha256 "431e2bcbd6651db48ec23268e42a2e1da42f61469cbac4739d4560db3e0b36f7"
    end
  end

  def install
    bin.install "baml"
  end
end