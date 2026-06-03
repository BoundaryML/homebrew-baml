class Baml < Formula
  desc "BAML wrapper - toolchain manager and launcher"
  homepage "https://github.com/BoundaryML/baml"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.1.0/baml-wrapper-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "4c793ff1e2ca454bc22bf5ad6ffa6a16898aec82a9fada27d20cad941e6bc951"
    end

    on_intel do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.1.0/baml-wrapper-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "31f2cdb6f76a5d190b418d690c3a113a9b9696cb7c401e3532da2bb3981eff10"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.1.0/baml-wrapper-0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cb0166b896cd2ff8b9349cc29fbeb89140a909a96c020dabb8b410615013c29e"
    end

    on_intel do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.1.0/baml-wrapper-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "506c0f531ad5d220a503f9135f104b50746d6dd14c6e9419859da94ebb58f14c"
    end
  end

  def install
    bin.install "bin/baml"
  end

  def caveats
    <<~EOS
      BAML wrapper installed.

      To install and select the current canary language toolchain:
        baml toolchain use canary

      To use nightly:
        baml toolchain use nightly

      IDE extension setup is explicit:
        baml ide install --cursor
    EOS
  end
end
