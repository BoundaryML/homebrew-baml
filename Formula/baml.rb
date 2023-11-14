
class Baml < Formula
  desc "BAML Utilities" 
  homepage "https://www.trygloo.com"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/GlooHQ/baml/releases/download/releases%2Fbaml-cli%2Fv0.1.1/baml-apple-intel.tar.gz"
      sha256 "68fbffc4da1168abd4c417b22b16240e658d2b1416bb39aebaf2b8c0b1350811"
    elsif Hardware::CPU.arm?
      url "https://github.com/GlooHQ/baml/releases/download/releases%2Fbaml-cli%2Fv0.1.1/baml-apple-arm.tar.gz"
      sha256 "ca3c3c1416f962b590e8d3ef551a01beebd8fd419c66d50752f8a97cc0ee5c76"
    end
  end

  def install
    bin.install "baml"
  end
end