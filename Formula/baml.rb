class Baml < Formula
  desc "BAML wrapper - toolchain manager and launcher"
  homepage "https://github.com/BoundaryML/baml"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.1.0/baml-wrapper-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "13795e1a366cf77e4a4a42107ba2417f4fd5c3dc46f128b09d36560613889044"
    end

    on_intel do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.1.0/baml-wrapper-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "3b2436299f7282df77749b2fed64423658a6cc5a541142ce3fa29287e77c2e6e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.1.0/baml-wrapper-0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8e5b1df2b89bcbe766cfef94c4788d054e32ddb28810757aad54d017e14d43b6"
    end

    on_intel do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.1.0/baml-wrapper-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "54cb6eeb2e03a6dace612edd0ea0c044c855047ff3d0346aab1b5269d9209f5b"
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
