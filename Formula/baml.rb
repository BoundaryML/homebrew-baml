class Gloo < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/homebrew-baml/releases/download/v0.1.1/baml-apple-intel.tar.gz"
      sha256 "80d8fa6f074053cac1acea80bf3148e8331f52356b98061e02e6899c19faf15a"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/homebrew-baml/releases/download/v0.1.1/baml-apple-arm.tar.gz"
      sha256 "e7ba9782c3f28336340b7b945554b26ccfe2d8ef0fd956136a6d3d3482319e03"
    end
  end

  def install
    bin.install "baml"
  end
end