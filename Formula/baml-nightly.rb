
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.20.0-canary.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.20.0/baml-apple-intel.tar.gz"
      sha256 "d561709ec33ec722c7d87abf63061e4a652c958ad93044b076e24950f3572964"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.20.0/baml-apple-arm.tar.gz"
      sha256 "ccd48dac1a291b6c2716b40ced089b167555efaec9329db7552c1262f192b907"
    end
  end

  def install
    bin.install "baml"
  end
end