
class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.14.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/release%2Fbaml-cli%2Fv0.14.0/baml-apple-intel.tar.gz"
      sha256 "f515ab4a8272ab46e8ba306dc56fcc51ec0c51a04bff5906e6f908511b57fa87"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/release%2Fbaml-cli%2Fv0.14.0/baml-apple-arm.tar.gz"
      sha256 "f9ac2cc93a9b39ea6d65b147a4c3851727188a85ab5e03ba2e631f2a35960ef3"
    end
  end

  def install
    bin.install "baml"
  end
end