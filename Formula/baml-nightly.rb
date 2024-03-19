
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.14.0-canary.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.14.0/baml-apple-intel.tar.gz"
      sha256 "ef669d2fcd10861e20eeea728a1f6a3b75b14b093d2af25eb2d6ff2a5f3bacf2"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.14.0/baml-apple-arm.tar.gz"
      sha256 "c52927992c3a7175ed8697af8f769d46211f79f83da9a6c51408eda6414c9c62"
    end
  end

  def install
    bin.install "baml"
  end
end