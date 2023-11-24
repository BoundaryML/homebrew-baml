
class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.2.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/releases%2Fbaml-cli%2Fv0.2.1/baml-apple-intel.tar.gz"
      sha256 "428f49fe8be046b7c65f928d7025741eb5e74822a6833ee6ab016b6d936dd4d2"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/releases%2Fbaml-cli%2Fv0.2.1/baml-apple-arm.tar.gz"
      sha256 "c9a5c345ee9751c357973b117617ed5549dd5d934f5f917c82007d967e17095b"
    end
  end

  def install
    bin.install "baml"
  end
end