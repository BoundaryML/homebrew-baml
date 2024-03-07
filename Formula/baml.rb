
class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.13.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/release%2Fbaml-cli%2Fv0.13.1/baml-apple-intel.tar.gz"
      sha256 "2ae5c984eb64956fa7f353e976a8684c0ffb289cdb752c03b456a61aefe33f3f"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/release%2Fbaml-cli%2Fv0.13.1/baml-apple-arm.tar.gz"
      sha256 "ce28d19e01c6bde476247d1a2ed5f9faade36170312181fdfd2e81f530f538db"
    end
  end

  def install
    bin.install "baml"
  end
end