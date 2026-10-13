# Writes each mutation as a patch against the worktree's HEAD, restoring each file.
import subprocess, sys, pathlib
W = sys.argv[1]; OUT = pathlib.Path(sys.argv[2])
M = [
 ("m1-roots-ignores-what-the-walk-does-not-reach", "build/publish.rs",
  "        if !(1..=out.len() as u64).any(", "        if false && !(1..=out.len() as u64).any("),
 ("m2-publisher-skips-root-ones-self-signature", "build/publish.rs",
  '    repo::self_signed(&first).map_err(|why| format!("root 1 is not self-signed: {why}"))?;\n', "    let _ = repo::self_signed(&first);\n"),
 ("m3-pruning-drops-targets-m-minus-one", "build/publish.rs",
  "    let keep_from = newest.version - 1;\n", "    let keep_from = newest.version;\n"),
 ("m4-pruning-forgets-what-m-minus-one-names", "build/publish.rs",
  "previous.iter().flat_map(|t| &t.items))", "previous.iter().flat_map(|t| &t.items).take(0))"),
 ("m5-archives-under-a-directory", "build/publish.rs",
  'let url = format!("{}-{}-{}.tar.gz"', 'let url = format!("archives/{}-{}-{}.tar.gz"'),
 ("m6-self-signed-vouches-for-nothing", "lib/update/src/repo.rs",
  "    let root = Root::of(&doc)?;\n    vouched(&doc, &root)?;\n    Ok(root)\n", "    let root = Root::of(&doc)?;\n    Ok(root)\n"),
 ("m7-first-root-grants-the-signing-key-the-root-role", "lib/update/src/repo.rs",
  "grants: [grant(&public), grant(signing), grant(signing)]", "grants: [grant(signing), grant(signing), grant(signing)]"),
 ("m8-repo-key-replaces-an-existing-one", "build/signing.rs",
  ".write(true).create_new(true).mode(0o600).open(path)", ".write(true).create(true).truncate(true).mode(0o600).open(path)"),
 ("m9-fingerprint-keeps-its-padding", "lib/update/src/repo.rs",
  "base64_encode(&key_id(key)).trim_end_matches('=')", "base64_encode(&key_id(key))"),
 ("m10-root-key-minted-at-the-umask", "build/root/src/main.rs",
  ".write(true).create_new(true).mode(mode).open(path)", ".write(true).create_new(true).mode(mode | 0o644).open(path)"),
 ("m11-seed-text-reader-takes-any-near-form", "lib/update/src/sig.rs",
  "    (seed_text(&seed) == text).then_some(seed)\n", "    Some(seed)\n"),
 ("m12-root-one-expires-at-the-clock", "build/root/src/main.rs",
  "first_root(&seed, &signing_key, now + LIFE)", "first_root(&seed, &signing_key, now + LIFE - 86_400)"),
 ("m13-root-key-new-replaces-an-existing-one", "build/root/src/main.rs",
  ".write(true).create_new(true).mode(mode).open(path)", ".write(true).create(true).truncate(true).mode(mode).open(path)"),
]
OUT.mkdir(parents=True, exist_ok=True)
for name, f, old, new in M:
    p = pathlib.Path(W) / f
    s = p.read_text()
    assert s.count(old) == 1, (name, s.count(old))
    p.write_text(s.replace(old, new))
    d = subprocess.run(["git", "-C", W, "diff", "--", f], capture_output=True, text=True, check=True).stdout
    subprocess.run(["git", "-C", W, "checkout", "--", f], check=True)
    (OUT / f"{name}.patch").write_text(d)
    print(name, "written")
