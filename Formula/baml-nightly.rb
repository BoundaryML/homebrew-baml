
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.14.0-canary.5"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.14.0/baml-apple-intel.tar.gz"
      sha256 "3dd0d11475b3350f8b7fcfad0574856238f89acfb35586079cd147166fc0dd2b"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.14.0/baml-apple-arm.tar.gz"
      sha256 "e0aa60b9017b4780f1e5e45abf225b197b077cda130629dd4630f0fc7900f70f"
    end
  end

  def install
    bin.install "baml"
  end
end