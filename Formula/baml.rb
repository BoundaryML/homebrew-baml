
class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.17.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/release%2Fbaml-cli%2Fv0.17.0/baml-apple-intel.tar.gz"
      sha256 "d1abe503317d1e57c1d65b3ecaa35b5d0a066e0e0f7b62cdbf8dda35b7a61086"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/release%2Fbaml-cli%2Fv0.17.0/baml-apple-arm.tar.gz"
      sha256 "923a428cfa089fb94253e11b3151896f9dd627661d9a21d38d48e02788474627"
    end
  end

  def install
    bin.install "baml"
  end
end