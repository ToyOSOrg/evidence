# Run from the worktree root after `cargo run -- --build-only` and a staging
# run that built the guest tests; readelf is binutils 2.x (`readelf -lW`).
# Each line: the program, then OK or W+X with every PT_LOAD's flags.
find target/x86_64-unknown-toyos tests/guest/rust-tests/target/x86_64-unknown-toyos -maxdepth 3 -type f -perm -u+x \
  | grep -v '/deps/\|/build/\|\.d$' | sort | while read -r f; do
  head -c4 "$f" | grep -q ELF || continue
  # The flags are the fields between the memory size and the alignment:
  # readelf writes `R E` with a space and `RWE` as one word.
  flags=$(readelf -lW "$f" | awk '$1=="LOAD" {f=""; for (i=7; i<NF; i++) f=f $i; printf "[%s] ", f}')
  if echo "$flags" | grep -qE 'W[A-Z]*E'; then v="W+X"; else v="OK"; fi
  echo "$v $f LOAD flags: $flags"
done
