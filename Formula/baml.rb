
class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.4.4"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/releases%2Fbaml-cli%2Fv0.4.4/baml-apple-intel.tar.gz"
      sha256 "c8113eedcecaa400199d97d7904eaaf810a3ba66b42ee02ba0fd5c87c442a85e"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/releases%2Fbaml-cli%2Fv0.4.4/baml-apple-arm.tar.gz"
      sha256 "a8bd2f9f491008d27010316acbb38f755598c3fd141ba47115ea4733de5a2045"
    end
  end

  def install
    bin.install "baml"
  end
end