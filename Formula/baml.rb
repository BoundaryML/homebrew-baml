
class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.7.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/release%2Fbaml-cli%2Fv0.7.1/baml-apple-intel.tar.gz"
      sha256 "a6a9bd61d256bffcf71324b490a6a491e2fc30694568bc1d0aee9b99ca9303c0"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/release%2Fbaml-cli%2Fv0.7.1/baml-apple-arm.tar.gz"
      sha256 "d1a26e278c4a796bd33c1f809935a80dacf7329e3b17545fd5b0e271ec94ec27"
    end
  end

  def install
    bin.install "baml"
  end
end