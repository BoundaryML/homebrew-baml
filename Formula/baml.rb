class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.1.1/baml-apple-intel.tar.gz"
      sha256 "7457b946c8716400109ae76310dc9d802e7204ada29f5e90c646be7a037274d3"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.1.1/baml-apple-arm.tar.gz"
      sha256 "e4e0cebbc678562461a875f07f382c68a85128666636b4847c2a39b55ae84896"
    end
  end

  def install
    bin.install "baml"
  end
end
