class Baml < Formula
  desc "Toolchain manager and launcher for the BAML language"
  homepage "https://github.com/BoundaryML/baml"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.4/baml-wrapper-no-self-update-0.2.4-aarch64-apple-darwin.tar.gz"
      sha256 "c7503e8397e9d2a261ad69a65e0658adee6c174b4d3e945fc9b46226c1a72873"
    end

    on_intel do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.4/baml-wrapper-no-self-update-0.2.4-x86_64-apple-darwin.tar.gz"
      sha256 "27b32f0e41273a7639d98e9df6d8a9c6ccefee171884221dd7be331ec4a2d3b8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.4/baml-wrapper-no-self-update-0.2.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c9c61fbd2f05f3b724ce1bcd2c21545f0e892985b61ac79c907353e9a30e212a"
    end

    on_intel do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.4/baml-wrapper-no-self-update-0.2.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dc5603b4b02dd3c9a3a8e6f8e3975a07c4b9e0f109141bed62f878569d83c61b"
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
