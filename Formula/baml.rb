
class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.11.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/release%2Fbaml-cli%2Fv0.11.1/baml-apple-intel.tar.gz"
      sha256 "26d9bd93ca4544c01fd6d25bdb0fe6ebd50890049b65fe5b7a73e6039dcdcaf4"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/release%2Fbaml-cli%2Fv0.11.1/baml-apple-arm.tar.gz"
      sha256 "a2e073d5e70620ae0a27fca36cc4c71ec0230a355686ba7af53907eab6537287"
    end
  end

  def install
    bin.install "baml"
  end
end