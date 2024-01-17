
class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.8.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/release%2Fbaml-cli%2Fv0.8.0/baml-apple-intel.tar.gz"
      sha256 "976bce38c80df9a5c9f15db758275e03899b69f6b1a5cf3fbad2abe3e9b3bec4"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/release%2Fbaml-cli%2Fv0.8.0/baml-apple-arm.tar.gz"
      sha256 "32cd3912db24d9d17b9e20c3013470f4dad4f81dfa2e47eaa55e1f0930769c84"
    end
  end

  def install
    bin.install "baml"
  end
end