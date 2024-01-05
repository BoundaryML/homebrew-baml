
class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.7.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/release%2Fbaml-cli%2Fv0.7.2/baml-apple-intel.tar.gz"
      sha256 "14c8b5fbbe37d99f0c8745647939f7479406ed9fe7128e64a12353fd12fd4faf"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/release%2Fbaml-cli%2Fv0.7.2/baml-apple-arm.tar.gz"
      sha256 "ead3f240f592e554ef3d5d8a222270d6de80bc3f73b79c32b69cae3613678beb"
    end
  end

  def install
    bin.install "baml"
  end
end