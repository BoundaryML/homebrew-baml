
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.4.0-canary.8"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.4.0/baml-apple-intel.tar.gz"
      sha256 "65f5d1985011128142fbd88a98a4dfedb54845a597c4bb1759706ca4845c09b9"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.4.0/baml-apple-arm.tar.gz"
      sha256 "cd739388cb68f3275d9748c10b347fd5ae84690e2cbc53a388b0a44f5fc36b6e"
    end
  end

  def install
    bin.install "baml"
  end
end