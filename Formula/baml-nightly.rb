
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.18.0-canary.4"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.18.0/baml-apple-intel.tar.gz"
      sha256 "42ed09cd481c323df46bec853334cab61dc33d89fcc10c4f1307a1a579e70ccb"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.18.0/baml-apple-arm.tar.gz"
      sha256 "4f3d5cee624e612c10a2c71d365e17ec1595a7330fec413a3483825ad316e974"
    end
  end

  def install
    bin.install "baml"
  end
end