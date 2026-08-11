class Baml < Formula
  desc "Toolchain manager and launcher for the BAML language"
  homepage "https://github.com/BoundaryML/baml"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.4/baml-wrapper-no-self-update-0.2.4-aarch64-apple-darwin.tar.gz"
      sha256 "b72c2fc04adcaaf8614928854deb5c8d3c86fe054b110f8c1478c6fe578e135b"
    end

    on_intel do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.4/baml-wrapper-no-self-update-0.2.4-x86_64-apple-darwin.tar.gz"
      sha256 "b6be85215c093fb59be5453e627f9e29778584d028d0238a37d8c073a9fccb4c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.4/baml-wrapper-no-self-update-0.2.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "088631266a72e1ec4e529b7e74558b7da0b1ba6e3be16e51e84905b672345295"
    end

    on_intel do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.4/baml-wrapper-no-self-update-0.2.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ddef5e0fd8acf9fce25d161732e04aaaf8e92ec2cdb87622685d119912c77391"
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
