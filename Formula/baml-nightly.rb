
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.14.0-canary.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.14.0/baml-apple-intel.tar.gz"
      sha256 "5423bda1df5b04c5fa310f26601fc5b4f4deb76d4e8d6b57149fea72a50dff68"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.14.0/baml-apple-arm.tar.gz"
      sha256 "6c278abc4f3bdebbf27419539802558092ef03e8bc617d13b32082924fd21bb4"
    end
  end

  def install
    bin.install "baml"
  end
end