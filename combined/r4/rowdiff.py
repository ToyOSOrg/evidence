# Scratch: the chacha20-poly1305/key row's machine code in each crypto_parity build: per function,
# its start address (and mod 64), size, and a hash of its instructions with addresses taken out.
import hashlib, re, subprocess, sys
BIN = sys.argv[1]
FUNCS = [r"crypto_parity::looped::<crypto_parity::tls_rows::\{closure#0\}>::\{closure#0\}",
         r"<toyos_crypto::aead::SealingKey>::chacha20_poly1305$",
         r"core::ptr::drop_glue::<toyos_crypto::aead::Key>",
         r"<toyos_crypto::secret::Secret<\[u8; 32\]> as core::ops::drop::Drop>::drop"]
for path in sys.argv[2:]:
    syms = subprocess.run([f"{BIN}/llvm-nm", "-C", "-S", "--defined-only", path], capture_output=True, text=True).stdout.splitlines()
    print(f"== {path.rsplit('/', 1)[-1]}")
    for f in FUNCS:
        hits = [l for l in syms if re.search(f, l.split(' ', 3)[-1])]
        if not hits:
            print(f"   {f[:60]:60} absent (inlined)"); continue
        addr, size = (int(x, 16) for x in hits[0].split()[:2])
        dis = subprocess.run([f"{BIN}/llvm-objdump", "-d", "--no-show-raw-insn", "--no-leading-addr", "-M", "intel",
                              f"--start-address={addr}", f"--stop-address={addr + size}", path], capture_output=True, text=True).stdout
        body = [l.strip() for l in dis.splitlines() if l.startswith(' ') or l.startswith('\t')]
        norm = [re.sub(r"0x[0-9a-f]+|<[^>]*>", "X", l) for l in body]
        h = hashlib.sha256("\n".join(norm).encode()).hexdigest()[:12]
        print(f"   {f[:60]:60} at {addr:#x} (mod 64 = {addr % 64:2}) size {size:4} insns {len(body):3} code {h}")
