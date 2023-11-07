class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.1.1/baml-apple-intel.tar.gz"
      sha256 "095c2af731624bc22a0c843de27ffc891d4930c62b7df35e0f95deec483c0634"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.1.1/baml-apple-arm.tar.gz"
      sha256 "b77619efc5b1fe410dd2f685c9789454af938b1c50d8de4cbed13a8f692c550b"
    end
  end

  def install
    bin.install "baml"
  end
end
