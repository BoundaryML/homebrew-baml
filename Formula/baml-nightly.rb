
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.11.0-canary.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.11.0/baml-apple-intel.tar.gz"
      sha256 "fe53e87e6acacf1d52f90d1e49833174c1f3319132295c999c3dfa44af3a6fee"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.11.0/baml-apple-arm.tar.gz"
      sha256 "d03b36255729b30337752509703c1c74fec3c51b2febbbe9a55f66ef74fc6adb"
    end
  end

  def install
    bin.install "baml"
  end
end