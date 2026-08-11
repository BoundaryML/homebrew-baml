class Baml < Formula
  desc "Toolchain manager and launcher for the BAML language"
  homepage "https://github.com/BoundaryML/baml"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.4/baml-wrapper-no-self-update-0.2.4-aarch64-apple-darwin.tar.gz"
      sha256 "54b0dcd9e74452230ec272cc356a3171f605b01e44937fb09313668d69cb5885"
    end

    on_intel do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.4/baml-wrapper-no-self-update-0.2.4-x86_64-apple-darwin.tar.gz"
      sha256 "3d01216748cd442c78ac42aa45e044a2625dca9a44fba51f3f770ee0ee0e3fd7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.4/baml-wrapper-no-self-update-0.2.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fdca8ca5ffc7c749a0f38de3e5f448b116d2496a32fe9aa80047cd01d50ca2b5"
    end

    on_intel do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.4/baml-wrapper-no-self-update-0.2.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a4666f8e0e72926feaa2641efef07f9e9d2f1432d96ccd4c8e31151ea27e4862"
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

    assert_match "baml wrapper 0.2.4",
                 shell_output("#{bin}/baml --version")
    assert_match "installed toolchains: (none)",
                 shell_output("#{bin}/baml toolchain list")
    assert_match "self-update is disabled in this build",
                 shell_output("#{bin}/baml self-update 2>&1", 1)
  end
end
