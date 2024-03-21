
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.15.0-canary.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.15.0/baml-apple-intel.tar.gz"
      sha256 "587db5bfb1b4c5749e64223194f4fa76d9f7acef457671c895a89b7397364cad"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.15.0/baml-apple-arm.tar.gz"
      sha256 "db12736611f7b0f3eb4c1d5a93f3157a12c6cd0285590a5a6c2baa656c3fb220"
    end
  end

  def install
    bin.install "baml"
  end
end