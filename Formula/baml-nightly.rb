
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.5.0-canary.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.5.0/baml-apple-intel.tar.gz"
      sha256 "952e1deaedee64186862955c1f86e223ede4f0064634056abcd78f1664ca1598"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.5.0/baml-apple-arm.tar.gz"
      sha256 "02b34c1ed907e249c409b447597bfeee9a4abf3041b87f38a68c7fa7bc24ce3b"
    end
  end

  def install
    bin.install "baml"
  end
end