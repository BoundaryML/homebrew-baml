
class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.15.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/release%2Fbaml-cli%2Fv0.15.0/baml-apple-intel.tar.gz"
      sha256 "5aac4783f48eee5f5b900b8223e9f0d8d721deaee4fde79750ea2855b6351253"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/release%2Fbaml-cli%2Fv0.15.0/baml-apple-arm.tar.gz"
      sha256 "690f67b162f6f378cfa082abb85334f7c5544f892a954240f94e220b4d303202"
    end
  end

  def install
    bin.install "baml"
  end
end