
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.18.0-canary.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.18.0/baml-apple-intel.tar.gz"
      sha256 "0eb4f230193580d9968d25ce5dbb991ffd6e822ecf262a19763cfbe3e08caf48"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.18.0/baml-apple-arm.tar.gz"
      sha256 "ee13f02383f5ab2ed1ad76c2a7e99084644170c292eab9ffc216425bde61726f"
    end
  end

  def install
    bin.install "baml"
  end
end