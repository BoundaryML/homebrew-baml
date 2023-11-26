
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.4.0-canary.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.4.0/baml-apple-intel.tar.gz"
      sha256 "e50e5bef49235d41b9162e86c0b04c337028986d8e25ba141a60b619094074f4"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.4.0/baml-apple-arm.tar.gz"
      sha256 "47936b1fdd98b5b711536915b711b46c8209f8c9f3f0ead1a5c55ca343a857e7"
    end
  end

  def install
    bin.install "baml"
  end
end