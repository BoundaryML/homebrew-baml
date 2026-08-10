class Baml < Formula
  desc "Toolchain manager and launcher for the BAML language"
  homepage "https://github.com/BoundaryML/baml"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.4/baml-wrapper-no-self-update-0.2.4-aarch64-apple-darwin.tar.gz"
      sha256 "031487245bd721128e37e58a344c7bf6acdca951465a7fd036eef00252e8e1b6"
    end

    on_intel do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.4/baml-wrapper-no-self-update-0.2.4-x86_64-apple-darwin.tar.gz"
      sha256 "05b35bf14a148c50e6774873aee0318fc3043599bc0d316e7638272282069946"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.4/baml-wrapper-no-self-update-0.2.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e9374e7109cac7fba48fb353cdf18ad4bf27866fe05710a7e3945d3c49963a38"
    end

    on_intel do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.4/baml-wrapper-no-self-update-0.2.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b05ae1eaacfb412ba9ac2c941a9c47ff8a385dff136c7cebac6f3f3572dd5cd1"
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
