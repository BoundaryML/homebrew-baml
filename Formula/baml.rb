class Baml < Formula
  desc "Toolchain manager and launcher for the BAML language"
  homepage "https://github.com/BoundaryML/baml"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.3/baml-wrapper-no-self-update-0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "d816ef14b0e7e7f894553d3a3541bfc5d90b6b722fda4061fccbd58bfa53c24e"
    end

    on_intel do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.3/baml-wrapper-no-self-update-0.2.3-x86_64-apple-darwin.tar.gz"
      sha256 "5afc1cf254c6645b38f4c54a3710671c7617e6854cdee1a99105e44083c306fc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.3/baml-wrapper-no-self-update-0.2.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4dc3e37be9301270745fdd1eee46d62f44fc939cc4d8546296df612efc602647"
    end

    on_intel do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.3/baml-wrapper-no-self-update-0.2.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f9837e05f7e4778776bca1e7ce776351706a66d41e012bd1e948f6e9666d1c98"
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

  test do
    ENV["BAML_HOME"] = (testpath/"baml-home").to_s
    ENV["HOME"] = testpath.to_s
    ENV.delete "BAML_VERSION"

    assert_match "baml wrapper 0.2.3",
                 shell_output("#{bin}/baml --version")
    assert_match "installed toolchains: (none)",
                 shell_output("#{bin}/baml toolchain list")
    assert_match "self-update is disabled in this build",
                 shell_output("#{bin}/baml self-update 2>&1", 1)
  end
end
