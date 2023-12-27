
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.6.0-canary.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.6.0/baml-apple-intel.tar.gz"
      sha256 "fb134c6e6e731c6463728dbdac34c29d7d15606d4175f6a46715a2c754a16ca6"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.6.0/baml-apple-arm.tar.gz"
      sha256 "8043a6aaa5d55259272546dd22bce3e43cefd9fd7364285448754982bf4bb399"
    end
  end

  def install
    bin.install "baml"
  end
end