
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.4.0-canary.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.4.0/baml-apple-intel.tar.gz"
      sha256 "98843b9f910b638e9d468db1d2948241d4392ffded5ead47b87ca05dc15fe53b"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.4.0/baml-apple-arm.tar.gz"
      sha256 "e95b097a40d579b1f109eda9c341d33a199bdee5e52dac62a34c0ffe3f76c9cc"
    end
  end

  def install
    bin.install "baml"
  end
end