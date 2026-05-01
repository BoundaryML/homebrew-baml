# homebrew-baml

Homebrew tap for the BAML language CLI alpha channel.

```bash
brew tap boundaryml/baml
brew install baml
baml-cli --version
brew upgrade baml
```

The `baml` formula currently tracks successful post-merge `canary` builds of
`baml_language` from `BoundaryML/baml`. GitHub release assets are prerelease
alpha builds until the 1.0/stable transition.

The installed executable is `baml-cli`.

This formula behaves like a nightly/canary channel: `brew upgrade baml`
installs the latest successful canary-backed alpha after the tap updates. Each
formula update uses immutable GitHub release URLs and SHA256 values, not a
floating latest URL.
