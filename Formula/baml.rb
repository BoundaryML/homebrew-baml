class Baml < Formula
  desc "Toolchain manager and launcher for the BAML language"
  homepage "https://github.com/BoundaryML/baml"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.4/baml-wrapper-no-self-update-0.2.4-aarch64-apple-darwin.tar.gz"
      sha256 "74ee18b0316b82ee817ca2085c83691df2e6d52d50ebe1d79c7ccc3c6f6b83bc"
    end

    on_intel do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.4/baml-wrapper-no-self-update-0.2.4-x86_64-apple-darwin.tar.gz"
      sha256 "7dd5b9d94fa2210cbd65c65d4d7cb0350216f1f7183c3f6deefce1b6b8386c79"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.4/baml-wrapper-no-self-update-0.2.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a6dd0438d5e98228fc41360658d711917f1f8a544e13a110d6e0e671b87ffc97"
    end

    on_intel do
      url "https://github.com/BoundaryML/baml/releases/download/baml-wrapper-0.2.4/baml-wrapper-no-self-update-0.2.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1cc232985c40121b059ea3a71eda4d687f7afbcc9217a7fb221bcaa90d3bd3f9"
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
