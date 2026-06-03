class Baml < Formula
  desc "BAML wrapper - toolchain manager and launcher"
  homepage "https://github.com/BoundaryML/baml"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.1.0/baml-wrapper-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "103971a973643503bcfe3b7dc950427c52b160399f7dc82911195afe6ba8ed01"
    end

    on_intel do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.1.0/baml-wrapper-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "4fea037affe3591aa4dd27773ce81af3324969e9546c7c63d82373de01530d88"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.1.0/baml-wrapper-0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "892dd26d0e2539d93b7190a06747df5191e4f5c50c83d24e99ffbe91307f3c61"
    end

    on_intel do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.1.0/baml-wrapper-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ee4c3feacacd1f9426037109fd3aa1b4bbf5842fba624c82eb892329c8c2af87"
    end
  end

  def install
    if (buildpath/"bin/baml").exist?
      bin.install "bin/baml"
    else
      bin.install "baml"
    end
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
