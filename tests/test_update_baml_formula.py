from __future__ import annotations

import json
import importlib.util
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SCRIPT = ROOT / "scripts" / "update-baml-formula.py"


def payload(version: str = "0.11.0-alpha.1842") -> dict:
    base = f"https://github.com/BoundaryML/baml/releases/download/baml-language-{version}/baml-language-{version}"
    return {
        "version": version,
        "assets": {
            "aarch64-apple-darwin": {
                "url": f"{base}-aarch64-apple-darwin.tar.gz",
                "sha256": "a" * 64,
            },
            "x86_64-apple-darwin": {
                "url": f"{base}-x86_64-apple-darwin.tar.gz",
                "sha256": "b" * 64,
            },
            "x86_64-unknown-linux-gnu": {
                "url": f"{base}-x86_64-unknown-linux-gnu.tar.gz",
                "sha256": "c" * 64,
            },
            "x86_64-pc-windows-msvc": {
                "url": f"{base}-x86_64-pc-windows-msvc.zip",
                "sha256": "d" * 64,
            },
        },
    }


class UpdateFormulaTests(unittest.TestCase):
    def run_update(self, formula: str | None, data: dict) -> tuple[subprocess.CompletedProcess[str], Path]:
        tmp = tempfile.TemporaryDirectory()
        self.addCleanup(tmp.cleanup)
        root = Path(tmp.name)
        (root / "Formula").mkdir()
        if formula is not None:
            (root / "Formula" / "baml.rb").write_text(formula)
        payload_path = root / "payload.json"
        payload_path.write_text(json.dumps(data))
        result = subprocess.run(
            [sys.executable, str(SCRIPT), str(payload_path)],
            cwd=root,
            text=True,
            capture_output=True,
            check=False,
        )
        return result, root / "Formula" / "baml.rb"

    def test_migrates_stale_legacy_formula(self) -> None:
        result, formula = self.run_update('url "https://github.com/GlooHQ/baml"\nbin.install "baml"\nversion "0.19.0"\n', payload())
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn('version "0.11.0-alpha.1842"', formula.read_text())
        self.assertIn('bin.install "baml-cli"', formula.read_text())

    def test_same_version_unchanged_is_noop(self) -> None:
        first, formula = self.run_update(None, payload())
        self.assertEqual(first.returncode, 0, first.stderr)
        second, formula = self.run_update(formula.read_text(), payload())
        self.assertEqual(second.returncode, 0, second.stderr)
        self.assertIn("already at", second.stdout)

    def test_same_version_changed_content_rewrites(self) -> None:
        result, formula = self.run_update('version "0.11.0-alpha.1842"\nbin.install "baml-cli"\n', payload())
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn("aarch64-apple-darwin", formula.read_text())

    def test_older_incoming_version_is_noop(self) -> None:
        current, formula = self.run_update(None, payload("0.11.0-alpha.1842"))
        self.assertEqual(current.returncode, 0, current.stderr)
        stale, formula = self.run_update(formula.read_text(), payload("0.11.0-alpha.1841"))
        self.assertEqual(stale.returncode, 0, stale.stderr)
        self.assertIn('version "0.11.0-alpha.1842"', formula.read_text())

    def test_newer_incoming_version_rewrites(self) -> None:
        current, formula = self.run_update(None, payload("0.11.0-alpha.1841"))
        self.assertEqual(current.returncode, 0, current.stderr)
        newer, formula = self.run_update(formula.read_text(), payload("0.11.0-alpha.1842"))
        self.assertEqual(newer.returncode, 0, newer.stderr)
        self.assertIn('version "0.11.0-alpha.1842"', formula.read_text())

    def test_validation_failures(self) -> None:
        cases = [
            {"assets": payload()["assets"]},
            {"version": "0.11.0-alpha.1", "assets": {k: v for k, v in payload()["assets"].items() if k != "x86_64-apple-darwin"}},
            {**payload(), "assets": {**payload()["assets"], "aarch64-apple-darwin": {"url": "https://example.com/a.tar.gz", "sha256": "a" * 64}}},
            {**payload(), "assets": {**payload()["assets"], "aarch64-apple-darwin": {"url": payload()["assets"]["aarch64-apple-darwin"]["url"], "sha256": "A" * 64}}},
        ]
        for data in cases:
            result, _ = self.run_update(None, data)
            self.assertNotEqual(result.returncode, 0)

    def test_version_sorting(self) -> None:
        spec = importlib.util.spec_from_file_location("update_baml_formula", SCRIPT)
        assert spec is not None and spec.loader is not None
        module = importlib.util.module_from_spec(spec)
        sys.modules[spec.name] = module
        spec.loader.exec_module(module)
        semver = module.Semver.parse
        self.assertGreater(semver("0.11.0-alpha.1842"), semver("0.11.0-alpha.1841"))
        self.assertLess(semver("0.11.0-alpha.1842"), semver("0.11.0"))
        self.assertGreater(semver("0.12.0-alpha.1"), semver("0.11.999-alpha.999999"))


if __name__ == "__main__":
    unittest.main()
