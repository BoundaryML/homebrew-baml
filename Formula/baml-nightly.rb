
class BamlNightly < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.4.0-canary.5"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.4.0/baml-apple-intel.tar.gz"
      sha256 "a8a830de8bdd9cec446e5c7c9abdbac5ddb713df04797dfbe2c54fcbbfc7efcc"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/unstable%2Fcli%2Fv0.4.0/baml-apple-arm.tar.gz"
      sha256 "82ae7f0d271fe58e739381ab02a624ba6ab0248f569f7e725a8a32d25c40c8fe"
    end
  end

  def install
    bin.install "baml"
  end
end