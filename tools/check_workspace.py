"""Build an exact tracked crate copy as lib/crypto in an isolated parent workspace.

Run from the crate root. Uses cached dependencies only, leaves ToyOS untouched,
and removes its temporary workspace and separate target directory on completion.
"""
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import tempfile


def main():
    root = Path(__file__).resolve().parents[1]
    output = root / 'evidence/current/workspace-integration'
    output.mkdir(parents=True, exist_ok=True)
    notice = (root / 'NOTICE').read_text()
    fixtures = re.findall(r'^\| (tests/data/[^ ]+) \| `([0-9a-f]{64})`', notice, re.M)
    for name, digest in fixtures:
        assert hashlib.sha256((root / name).read_bytes()).hexdigest() == digest, name
    assert fixtures
    (output / 'notice-hashes.json').write_text(json.dumps(dict(fixtures), indent=2) + '\n')
    files = subprocess.check_output(['git', 'ls-files', '-z'], cwd=root).decode().split('\0')
    with tempfile.TemporaryDirectory(prefix='toyos-crypto-workspace-') as directory:
        scratch = Path(directory)
        workspace = scratch / 'parent'
        crypto = workspace / 'lib/crypto'
        consumer = workspace / 'consumer'
        crypto.mkdir(parents=True)
        (consumer / 'src').mkdir(parents=True)
        for name in files:
            if not name or name.split('/')[0] in ('evidence', 'claude-comms', 'benchmarks', 'tools'):
                continue
            dest = crypto / name
            dest.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(root / name, dest)
        (workspace / 'Cargo.toml').write_text('[workspace]\nmembers = ["lib/crypto", "consumer"]\nresolver = "3"\n')
        shutil.copyfile(root / 'Cargo.lock', workspace / 'Cargo.lock')
        (consumer / 'Cargo.toml').write_text('''[package]
name = "workspace-consumer"
version = "0.0.0"
edition = "2024"
[dependencies]
toyos-crypto = { path = "../lib/crypto", default-features = false }
[features]
provider = ["toyos-crypto/rustls-provider"]
''')
        (consumer / 'src/lib.rs').write_text('#![no_std]\npub fn digest(input: &[u8]) -> Result<[u8;32], toyos_crypto::Error> {\n    toyos_crypto::hash::Sha256::digest(input)\n}\n')
        env = dict(os.environ, CARGO_NET_OFFLINE='true', CARGO_TARGET_DIR=str(scratch / 'build-outside-workspace'))
        checks = [
            ('resolve', ['cargo', 'generate-lockfile', '--offline']),
            ('core', ['cargo', 'check', '--locked', '--offline', '-p', 'workspace-consumer']),
            ('provider', ['cargo', 'check', '--locked', '--offline', '-p', 'workspace-consumer', '--features', 'provider']),
            ('core-tree', ['cargo', 'tree', '--locked', '--offline', '-p', 'workspace-consumer', '--edges', 'normal']),
            ('provider-tree', ['cargo', 'tree', '--locked', '--offline', '-p', 'workspace-consumer', '--features', 'provider', '--edges', 'normal']),
        ]
        for name, command in checks:
            result = subprocess.run(command, cwd=workspace, env=env, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
            text = result.stdout.decode().replace(str(scratch.resolve()), '<isolated-workspace>')
            text = text.replace(str(scratch), '<isolated-workspace>')
            text = text.replace(str(Path.home()), '<user>')
            (output / (name + '.log')).write_text(text)
            (output / (name + '.exit')).write_text(str(result.returncode) + '\n')
            assert result.returncode == 0, (name, text)
            if name.endswith('tree'):
                assert not re.search(r'\b(ring|aws-lc-rs) v', text)
            print(name + ': passed', flush=True)


if __name__ == '__main__':
    main()
