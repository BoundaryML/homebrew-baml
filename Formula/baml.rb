class Baml < Formula
  desc "BAML wrapper - toolchain manager and launcher"
  homepage "https://github.com/BoundaryML/baml"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.0/baml-wrapper-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "e23a6866aaa225f45c2f750db5e615f474e17a6eefa5c1805b23c857b881dea2"
    end

    on_intel do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.0/baml-wrapper-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "0ef33631317cbf52c9936ed3c17888a3f55cab04cd24c1508419317b1dbe3aca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.0/baml-wrapper-0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f164bc01ec011d7bd60301b2d6d295a51176058aaf2494f64e46403811aaf7aa"
    end

    on_intel do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.0/baml-wrapper-0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4e21a6166cbe4fa7fa165451b9427fc3498b66491a063819628c20438bf41dcd"
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
