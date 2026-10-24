# Scratch: writes each mutant as a patch against the worktree's lib/crypto (-p1 from the repo root).
import subprocess, sys, os
W = '<worktree>'
OUT = sys.argv[1]
K = 'lib/crypto/src/arch/x86_64/chacha.rs'
MUTANTS = {
  # the stitched absorbs skip the third block of each double round
  'm1-round-skips': (K, 'for j in 3 * round..(3 * round + 3).min(blocks.len()) {', 'for j in 3 * round..(3 * round + 2).min(blocks.len()) {'),
  # the blocks past thirty are never absorbed
  'm2-after-dropped': (K, '        for j in 30..blocks.len() {\n            *acc = absorb(*acc, &blocks[j], r, true);\n        }\n    }\n\n    /// Eight blocks', '        for j in 31..blocks.len() {\n            *acc = absorb(*acc, &blocks[j], r, true);\n        }\n    }\n\n    /// Eight blocks'),
  # the MAC skew taken from the prefix's length, not its complement
  'm3-skew': (K, 'prefix.len().wrapping_neg() % 16', 'prefix.len() % 16'),
  # OpenSSH's partial last block padded as RFC 8439's
  'm4-last-padded': (K, 'absorb(acc, &terminated(&padded(bytes), bytes.len(), 1), r, false)', 'absorb(acc, &padded(bytes), r, true)'),
  # the eight-block tail written as XOR over the stale stream buffer
  'm5-emit-xor': (K, '            emit_eight(v, stream, false);', '            emit_eight(v, stream, true);'),
  # one byte of the 16-bit rotation mask wrong
  'm6-rotate16': (K, '    let mask = _mm256_setr_epi8(\n        2, 3, 0, 1,', '    let mask = _mm256_setr_epi8(\n        3, 3, 0, 1,'),
  # an open hashes its first batch only to the batch's end, not the MAC block's
  'm7-open-reach': (K, 'let mut hashed = if seal { 0 } else { reach(first) };', 'let mut hashed = if seal { 0 } else { first.min(len) };'),
  # a seal's lag skips the bytes short of a whole block
  'm8-seal-lag': (K, 'hashed = if seal { whole } else { upto };', 'hashed = if seal { done } else { upto };'),
  # a one-pair batch asked for up to three blocks
  'm9-one-pair': (K, '            if n <= 128 {\n                let rows = pairs::<1>', '            if n <= 192 {\n                let rows = pairs::<1>'),
  # the refusal returns the decrypted record
  'm10-no-wipe': ('lib/crypto/src/aead.rs', '    if !opened {\n        data.fill(0);', '    if !opened {'),
  # OpenSSH's MAC taken over the plaintext header
  'm11-ssh-header-after': ('lib/crypto/src/ssh.rs', '''                self.keys.crypt_header(seq, header);
                match self.keys.one_pass(seq, header, payload, true) {
                    Some(tag) => tag,''', '''                match self.keys.one_pass(seq, header, payload, true) {
                    Some(tag) => {
                        self.keys.crypt_header(seq, header);
                        tag
                    }'''),
  # the open's first batch carries seven blocks again
  'm12-open-first': (K, 'let first = if seal || len <= 448 { len.min(448) } else { 64 };', 'let first = if len <= 448 || !seal { len.min(448) } else { 64 };'),
}
for name, (path, old, new) in MUTANTS.items():
    p = os.path.join(W, path)
    s = open(p).read()
    assert s.count(old) == 1, (name, s.count(old))
    open(p, 'w').write(s.replace(old, new))
    d = subprocess.run(['git', '-C', W, 'diff', '--', path], capture_output=True, text=True).stdout
    subprocess.run(['git', '-C', W, 'checkout', '--', path], check=True)
    open(os.path.join(OUT, name + '.patch'), 'w').write(d)
    print(name, len(d))
