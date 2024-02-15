
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.13.0-canary.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.13.0/baml-apple-intel.tar.gz"
      sha256 "05a3913d58745008306a76a996c1a8d59e2f031405bc1e59379ed5a93fa7853d"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.13.0/baml-apple-arm.tar.gz"
      sha256 "02cfc87df35afc9d5e8c925558423f9528f3c85a4d24605b3611898da8337c36"
    end
  end

  def install
    bin.install "baml"
  end
end