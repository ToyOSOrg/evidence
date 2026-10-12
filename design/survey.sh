#!/bin/sh
# The survey behind the prune's design: who names each program a manifest
# ships, each guest binary and each fixture. Run from the worktree root.
set -u
echo "== head: $(git rev-parse HEAD)"

echo
echo "== 1. proctest: every tracked mention (git grep -n -w proctest)"
git grep -n -w proctest

echo
echo "== 2. the net applet: its module, dispatch, symlink and issue"
git grep -n -e 'bin/net\b' -e 'toybox net\b' -e 'toybox-net-cannot-reach-netstack' -- ':!Cargo.lock'; git grep -n -e 'mod net;' -- system/toybox
echo "-- commands! dispatch:"
git grep -n 'commands!(' -- system/toybox

echo
echo "== 3. the spin applet: every mention of its name or path"
git grep -n -e 'bin/spin' -e 'toybox spin' -e 'mod spin' -e '"spin"' -e 'the-shipped-image-carries-two-test-programs'

echo
echo "== 4. each RUST_SKIP binary and the files that drive it (literal test_rs_<name>, or its machine test's JOB)"
for n in $(awk '/^const RUST_SKIP/,/^\];/' tests/toyos.rs | grep -o '^    "[a-z0-9_]*"' | tr -d ' "'); do
  hits=$(git grep -l -e "test_rs_$n\b" -- tests/toyos.rs tests/common tests/images tests/metal tests/guest build images system | tr '\n' ' ')
  [ -z "$hits" ] && hits="(no literal) $(git grep -n -e "JOB: &str = \"$n\"" -e "=> .*$n(" -e "\"$n\" =>" -- tests/toyos.rs tests/common | tr '\n' ' ')"
  echo "$n: $hits"
done

echo
echo "== 5. every rust-tests binary not on RUST_SKIP runs on the shared boot (discover_rust_tests); count of binaries:"
ls tests/guest/rust-tests/src/bin | wc -l

echo
echo "== 6. each test image and the files that boot it"
for f in tests/images/*.toml; do
  b=$(basename "$f" .toml)
  echo "$b: $(git grep -l -e "$b" -- tests build ':!tests/images' | tr '\n' ' ')"
done

echo
echo "== 7. multi-call probes: each applet and who names it"
for n in preempt fp_isolation first_entry unmap_touch debug_refused; do
  echo "kernelprobe $n: $(git grep -l -w "$n" -- tests/images tests/toyos.rs | tr '\n' ' ')"
done
for n in fbcheck fbfill fbread usbwrite usbread; do
  echo "metalprobe $n: $(git grep -l -w "$n" -- tests build ':!tests/guest/metalprobe' | tr '\n' ' ')"
done

echo
echo "== 8. guest C cases (the harness compiles tests/guest/c) and who names each"
for f in tests/guest/c/*.c; do
  n=$(basename "$f" .c)
  echo "$n.c: $(git grep -n -e "\"$n\"" -e "test_c_$n\b" -e "$n\.c" -- tests build ':!tests/corpus' ':!tests/guest/c' | tr '\n' ' ')"
done

echo
echo "== 9. rust-tests fixtures and shared modules"
for n in tls-cranelift tls-dlopen-lib tls-multi-crate; do
  echo "$n: $(git grep -l -e "$n" -- tests ':!tests/guest/rust-tests/'"$n" | tr '\n' ' ')"
done
echo "tls-lib (as libtls_lib.so): $(git grep -l libtls_lib -- tests build ':!tests/guest/rust-tests/tls-lib' | tr '\n' ' ')"
for n in census_wait isa_row lent_hello roster served_log stream_ends tone; do
  echo "mod $n: $(git grep -l -e "mod $n" -- tests | tr '\n' ' ')"
done

echo
echo "== 10. toybox applets: which tests or build code name each"
for n in cat cp echo free grep hexdump locale ls mkdir mv net ps pwd reboot rm screen shutdown spin stats tone; do
  echo "$n: $(git grep -l -e "bin/$n\b" -e "\"$n\"" -e "toybox $n\b" -- tests build ':!tests/corpus' ':!tests/images' | tr '\n' ' ')"
done

echo
echo "== 11. every workspace binary under system/ and apps/, and the manifests that carry it"
for d in system/* apps/*; do
  [ -f "$d/Cargo.toml" ] || continue
  n=$(basename "$d")
  echo "$n: $(git grep -l -e "^\[programs\.$n\]" -e "^$n = " -- images tests/images | tr '\n' ' ')"
done

echo
echo "== 12. fork clones and cargo checkouts name none of the three"
grep -rIl -w -e proctest -e '/bin/spin' -e '/bin/net' ~/.cargo/git/checkouts /Users/jan/Dev/jan/toyos/rust/library
echo "grep exit=$? (1: no match)"
