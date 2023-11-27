
class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.3.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/releases%2Fbaml-cli%2Fv0.3.1/baml-apple-intel.tar.gz"
      sha256 "1be3a2492ab15531a7b6b46bd5dedc47b40bef71d67ed8cf880a9770e24dc23d"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/releases%2Fbaml-cli%2Fv0.3.1/baml-apple-arm.tar.gz"
      sha256 "13ebab0ca8fad0c41d853838553dbf71d4ea6644613f0a51d4580dc92bd50d1c"
    end
  end

  def install
    bin.install "baml"
  end
end