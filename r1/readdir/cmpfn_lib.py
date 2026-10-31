# cmpfn.py <base-elf> <head-elf> <root-symbol>...: compare the machine code of
# each root and everything it calls (transitively), by demangled name, with
# addresses and crate hashes masked.
import re, subprocess, sys
B = '<rustup>/toolchains/nightly-2026-07-22-aarch64-apple-darwin/lib/rustlib/aarch64-apple-darwin/bin'
def syms(elf):
    out = subprocess.run([B + '/llvm-nm', '-C', '-S', '--defined-only', elf], capture_output=True, text=True).stdout
    m = {}
    for line in out.splitlines():
        p = line.split(' ', 3)
        if len(p) == 4 and p[2].lower() in 'tw':
            m.setdefault(p[3], (int(p[0], 16), int(p[1], 16)))
    return m
def dis(elf, a, n):
    out = subprocess.run([B + '/llvm-objdump', '-d', '-C', '--no-show-raw-insn', f'--start-address={a}', f'--stop-address={a+n}', elf], capture_output=True, text=True).stdout
    lines = [l for l in out.splitlines() if re.match(r'^\s+[0-9a-f]+:', l)]
    calls = set(re.findall(r'call\w*\s+0x[0-9a-f]+ <([^>+]+)>', '\n'.join(lines)))
    norm = [re.sub(r'\[[0-9a-f]{8,}\]', '', re.sub(r'0x[0-9a-f]+|^\s+[0-9a-f]+:', '', l)).strip() for l in lines]
    norm = [re.sub(r'<[^>]*\+0x?[0-9a-f]*>', '<+>', l) for l in norm]
    norm = [re.sub(r'anon\.[0-9a-f]+\.[0-9]+\.llvm\.[0-9]+', 'anon', l) for l in norm]
    return norm, calls
