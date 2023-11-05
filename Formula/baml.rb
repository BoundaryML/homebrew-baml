class Gloo < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/homebrew-baml/releases/download/v0.1.0/baml-apple-intel.tar.gz"
      sha256 "6ccb3bfbe0bf15f64c48ecc7426ef31030af87bde03524055355205bac6a9eba"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/homebrew-baml/releases/download/v0.1.0/baml-apple-arm.tar.gz"
      sha256 "e547b2021230240ef907e46c96c79a9c7487c78cfd16b0668a6fd80935db329e"
    end
  end

  def install
    bin.install "baml"
  end
end