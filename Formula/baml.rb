
class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.6.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/releases%2Fbaml-cli%2Fv0.6.2/baml-apple-intel.tar.gz"
      sha256 "17fe0565c15c383fff19ba31322bd7eecb8245a4e318574cdeeacffb4cdfadee"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/releases%2Fbaml-cli%2Fv0.6.2/baml-apple-arm.tar.gz"
      sha256 "60c20c0bff0b5b5d3c6f73e376380f2a77754983e22c575c87ec780343a76f8d"
    end
  end

  def install
    bin.install "baml"
  end
end