#!/bin/bash
# Scratch: disassembles a probe binary's GCM kernels into inspect/<tag>/ and
# summarises each: instruction counts and stack references.
set -euo pipefail
B=$1 TAG=$2
BIN=$(rustc +nightly-2026-07-22 --print sysroot)/lib/rustlib/aarch64-apple-darwin/bin
D=$(dirname $0)/$TAG; mkdir -p $D
$BIN/llvm-nm -C -n $B > $D/nm.txt
grep -E " t toyos_crypto::arch::x86_64::(vaes512|aesni)::" $D/nm.txt | while read addr t name; do
  next=$(awk -v a=$addr 'found {print $1; exit} $1==a {found=1}' $D/nm.txt)
  f=$D/$(echo "$name" | sed 's/toyos_crypto::arch::x86_64:://; s/[^A-Za-z0-9_]/_/g').s
  $BIN/llvm-objdump -d --no-show-raw-insn --x86-asm-syntax=intel -C --start-address=0x$addr --stop-address=0x$next $B > $f
  printf "%-60s %5d insns  vaesenc %3d  aesenc %3d  clmul %3d  calls %d  rsp-refs %d\n" "$name" $(grep -cE '^\s+[0-9a-f]+:' $f) $(grep -cE '\svaesenc\s' $f) $(grep -cE '\saesenc\s' $f) $(grep -cE 'pclmulqdq' $f) $(grep -cE '\scall\s' $f) $(grep -E 'rsp' $f | grep -vcE 'push|pop|and\s+rsp|sub\s+rsp|lea\s+rsp|mov\s+rbp, rsp')
done
