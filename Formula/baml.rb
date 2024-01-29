
class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.10.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/release%2Fbaml-cli%2Fv0.10.0/baml-apple-intel.tar.gz"
      sha256 "9fc04fbfecdf8d1e2467434018a60d6360d9a55361576a1bbbfd21018ee5f12d"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/release%2Fbaml-cli%2Fv0.10.0/baml-apple-arm.tar.gz"
      sha256 "bea5e20c9ccec8c7c38d3b243a73cf2125a6a64d414dfc8d114a89673467e777"
    end
  end

  def install
    bin.install "baml"
  end
end