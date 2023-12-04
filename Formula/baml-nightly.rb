
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.4.0-canary.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.4.0/baml-apple-intel.tar.gz"
      sha256 "aefdbc7e0cac4f22b2e6584724cfb58730873b98ad61fc85134fa12e4ddeb260"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.4.0/baml-apple-arm.tar.gz"
      sha256 "63222c826935f74805a90359289d61832e682ec212c8e128c5cd9f7fa45c59cf"
    end
  end

  def install
    bin.install "baml"
  end
end