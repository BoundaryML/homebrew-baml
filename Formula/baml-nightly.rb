
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.18.0-canary.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.18.0/baml-apple-intel.tar.gz"
      sha256 "f67e0c25b87f12ed44e4df47813c7366ee2b5152a99952b6b4b9fcb8b5c8ed96"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.18.0/baml-apple-arm.tar.gz"
      sha256 "fe37555f119238904bee88aeb1512864d74d15f5f22c71928382335a191235f2"
    end
  end

  def install
    bin.install "baml"
  end
end