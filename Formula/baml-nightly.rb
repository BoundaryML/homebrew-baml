
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.2.1-canary.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.2.1/baml-apple-intel.tar.gz"
      sha256 "4574ee6e73fac9810ea02f37ad3d4c16a9aa67e6d57b4a9de56967466761f32f"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.2.1/baml-apple-arm.tar.gz"
      sha256 "864e0d553a71f221d6acd8dcd22d874c430c24d744bcbdb1e0ea5ba9a2403fa0"
    end
  end

  def install
    bin.install "baml"
  end
end