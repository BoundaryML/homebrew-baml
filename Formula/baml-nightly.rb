
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.18.0-canary.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.18.0/baml-apple-intel.tar.gz"
      sha256 "5c8d65b56693946eb987ee8783ae93c6e7e212d21a78153f09cd00f8749850fa"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.18.0/baml-apple-arm.tar.gz"
      sha256 "76a19e22ff882e2477f0e3e5304521345adb4f644f8f0b4095bfa20e6eed2272"
    end
  end

  def install
    bin.install "baml"
  end
end