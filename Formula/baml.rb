
class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.4.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/releases%2Fbaml-cli%2Fv0.4.2/baml-apple-intel.tar.gz"
      sha256 "401e308c7b6d22a555feb9adb03f1b7761ff279bde6ec132f23c3b8bc8304471"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/releases%2Fbaml-cli%2Fv0.4.2/baml-apple-arm.tar.gz"
      sha256 "c74d4e95d814ba5bc04e68ab251625313d3d3a3dd0c1c328f271cf09ee35bf8a"
    end
  end

  def install
    bin.install "baml"
  end
end