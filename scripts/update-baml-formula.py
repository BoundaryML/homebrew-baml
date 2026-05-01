#!/usr/bin/env python3
from __future__ import annotations

import json
import re
import sys
from dataclasses import dataclass
from pathlib import Path


FORMULA = Path("Formula/baml.rb")
VERSION_RE = re.compile(r"^(\d+)\.(\d+)\.(\d+)-alpha\.(\d+)$")
SHA256_RE = re.compile(r"^[0-9a-f]{64}$")
URL_PREFIX = "https://github.com/BoundaryML/baml/releases/download/"


@dataclass(frozen=True)
class Semver:
    major: int
    minor: int
    patch: int
    alpha: int | None

    @classmethod
    def parse(cls, value: str) -> "Semver":
        alpha = VERSION_RE.fullmatch(value)
        if alpha:
            return cls(*(int(part) for part in alpha.groups()))
        stable = re.fullmatch(r"^(\d+)\.(\d+)\.(\d+)$", value)
        if stable:
            major, minor, patch = (int(part) for part in stable.groups())
            return cls(major, minor, patch, None)
        raise ValueError(f"unsupported version {value!r}")

    def sort_key(self) -> tuple[int, int, int, int, int]:
        return (
            self.major,
            self.minor,
            self.patch,
            1 if self.alpha is None else 0,
            -1 if self.alpha is None else self.alpha,
        )

    def __lt__(self, other: "Semver") -> bool:
        return self.sort_key() < other.sort_key()

    def __gt__(self, other: "Semver") -> bool:
        return self.sort_key() > other.sort_key()


def fail(message: str) -> None:
    print(f"error: {message}", file=sys.stderr)
    raise SystemExit(1)


def require_asset(payload: dict, target: str) -> dict:
    try:
        asset = payload["assets"][target]
    except KeyError:
        fail(f"missing asset for {target}")
    url = asset.get("url")
    sha256 = asset.get("sha256")
    if not isinstance(url, str) or not url.startswith(URL_PREFIX):
        fail(f"{target} url must start with {URL_PREFIX}")
    if not isinstance(sha256, str) or not SHA256_RE.fullmatch(sha256):
        fail(f"{target} sha256 must be 64 lowercase hex characters")
    return {"url": url, "sha256": sha256}


def load_payload(path: Path) -> tuple[str, dict[str, dict[str, str]]]:
    try:
        payload = json.loads(path.read_text())
    except json.JSONDecodeError as exc:
        fail(f"invalid JSON payload: {exc}")

    version = payload.get("version")
    if not isinstance(version, str) or not VERSION_RE.fullmatch(version):
        fail("version must match MAJOR.MINOR.PATCH-alpha.NUMBER")

    assets = {
        "aarch64-apple-darwin": require_asset(payload, "aarch64-apple-darwin"),
        "x86_64-apple-darwin": require_asset(payload, "x86_64-apple-darwin"),
        "x86_64-unknown-linux-gnu": require_asset(payload, "x86_64-unknown-linux-gnu"),
    }
    return version, assets


def current_formula_state() -> tuple[str | None, bool, str]:
    if not FORMULA.exists():
        return None, False, ""
    content = FORMULA.read_text()
    version_match = re.search(r'version\s+"([^"]+)"', content)
    legacy = "GlooHQ/baml" in content or 'bin.install "baml"' in content
    return (version_match.group(1) if version_match else None), legacy, content


def render_formula(version: str, assets: dict[str, dict[str, str]]) -> str:
    mac_arm = assets["aarch64-apple-darwin"]
    mac_intel = assets["x86_64-apple-darwin"]
    linux_x64 = assets["x86_64-unknown-linux-gnu"]
    return f'''class Baml < Formula
  desc "BAML language CLI"
  homepage "https://github.com/BoundaryML/baml"
  version "{version}"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "{mac_arm["url"]}"
      sha256 "{mac_arm["sha256"]}"
    elsif Hardware::CPU.intel?
      url "{mac_intel["url"]}"
      sha256 "{mac_intel["sha256"]}"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "{linux_x64["url"]}"
      sha256 "{linux_x64["sha256"]}"
    else
      odie "BAML alpha Homebrew builds currently support Linux x86_64 only"
    end
  end

  def install
    bin.install "baml-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{{bin}}/baml-cli --version")
  end
end
'''


def main() -> None:
    if len(sys.argv) != 2:
        fail("usage: scripts/update-baml-formula.py PAYLOAD.json")

    version, assets = load_payload(Path(sys.argv[1]))
    current_version, legacy, current_content = current_formula_state()
    next_content = render_formula(version, assets)

    if current_version and not legacy:
        incoming = Semver.parse(version)
        current = Semver.parse(current_version)
        if incoming < current:
            print(f"stale update ignored: {version} is older than {current_version}")
            return

    if current_content == next_content:
        print(f"Formula/baml.rb already at {version}")
        return

    FORMULA.parent.mkdir(parents=True, exist_ok=True)
    FORMULA.write_text(next_content)
    print(f"updated Formula/baml.rb to {version}")


if __name__ == "__main__":
    main()
