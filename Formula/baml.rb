class Baml < Formula
  desc "Toolchain manager and launcher for the BAML language"
  homepage "https://github.com/BoundaryML/baml"
  url "https://github.com/BoundaryML/baml/archive/refs/tags/baml-wrapper-0.2.1.tar.gz"
  sha256 "b641e2418819613c702b35436cb543a67054682cc67b877e97119dcf005d9180"
  license "Apache-2.0"

  livecheck do
    url :stable
    regex(/^baml-wrapper[._-]v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "cmake" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install",
           *std_cargo_args(
             path:     "baml_language/crates/baml",
             features: "no-self-update",
           )
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

    system bin/"baml", "toolchain", "use", "canary"
    system bin/"baml", "init", "--name", "homebrew-test"
    assert_path_exists testpath/"baml.toml"
    assert_path_exists testpath/"baml_src/main.baml"
    system bin/"baml", "check"
    assert_match "self-update is disabled in this build",
                 shell_output("#{bin}/baml self-update 2>&1", 1)
  end
end
