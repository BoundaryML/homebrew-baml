
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.7.0-canary.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.7.0/baml-apple-intel.tar.gz"
      sha256 "319590bc153e1e99f913f66243efe3110f185d692a5b928f206ee78c50bff31b"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.7.0/baml-apple-arm.tar.gz"
      sha256 "4f830ccd53c7d40f91fb900df36cde56a0fe3a57bfd697b54f3b049204acdd3e"
    end
  end

  def install
    bin.install "baml"
  end
end