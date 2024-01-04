
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.7.0-canary.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.7.0/baml-apple-intel.tar.gz"
      sha256 "4c5ed6bfb8601513bb57c4ec30c6f550b33bbab190ae4f618d826a389532bcf3"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.7.0/baml-apple-arm.tar.gz"
      sha256 "99909d8c565d7909c7a52b637d095e22b640cbc938e1a25a0f8b3aaaaa954137"
    end
  end

  def install
    bin.install "baml"
  end
end