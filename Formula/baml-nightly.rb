
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.10.0-canary.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.10.0/baml-apple-intel.tar.gz"
      sha256 "ba7f11ca6883bb693b5a8c2e08e8f885812fbd188654a93230d70aa52f42cc65"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.10.0/baml-apple-arm.tar.gz"
      sha256 "b8acfbac043c06e667a0cce797aa376c25721b365a67fcc9ccfe9806c188370e"
    end
  end

  def install
    bin.install "baml"
  end
end