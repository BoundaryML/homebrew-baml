
class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.14.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/release%2Fbaml-cli%2Fv0.14.2/baml-apple-intel.tar.gz"
      sha256 "0ecd944f8da1713e5163b3176a3e0dd73a20dfbce9f6664ffd1893265a69e557"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/release%2Fbaml-cli%2Fv0.14.2/baml-apple-arm.tar.gz"
      sha256 "50c32d4ed0309f71b6a48a7e2a8453126185b932c9fb79e938756baca0eb3f3f"
    end
  end

  def install
    bin.install "baml"
  end
end