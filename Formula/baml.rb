
class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.19.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/release%2Fbaml-cli%2Fv0.19.0/baml-apple-intel.tar.gz"
      sha256 "3e8c19fb3aefd32e49185004631e99be32a73a0aec0695a5296f52e69434d0c3"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/release%2Fbaml-cli%2Fv0.19.0/baml-apple-arm.tar.gz"
      sha256 "51f51b6c6ceb50da6bd50fcd41a71df5179fa865e895ab384e39e07a320fb1fc"
    end
  end

  def install
    bin.install "baml"
  end
end