
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.6.0-canary.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.6.0/baml-apple-intel.tar.gz"
      sha256 "a4c78c00845089dc59bb37190d61c9ce331ea97382506ca3c789fc242b64fba9"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.6.0/baml-apple-arm.tar.gz"
      sha256 "29b3659c10120dc2d48cb83e833d3706c4bfb9c4390d93e70942fa52e8688948"
    end
  end

  def install
    bin.install "baml"
  end
end