
class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.13.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/release%2Fbaml-cli%2Fv0.13.0/baml-apple-intel.tar.gz"
      sha256 "06ad8550e9b3ac0ecec1f6f9eba39d15fdb0726d831c64ad1b72a1f4138d6bcf"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/release%2Fbaml-cli%2Fv0.13.0/baml-apple-arm.tar.gz"
      sha256 "f4233f8b9d5633ab8e9bf7fe2132003f7ddebc8acf233cefff7ab6f553358ddb"
    end
  end

  def install
    bin.install "baml"
  end
end