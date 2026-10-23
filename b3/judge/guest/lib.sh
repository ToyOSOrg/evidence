# Logs each command's stdout, stderr and exit status under $R as NN.*.
N=${N:-0}
r() {
  N=$((N+1)); f=$(printf '%s/%02d' "$R" "$N")
  printf '%s\n' "$1" > "$f.cmd"
  bash -c "$1" > "$f.out" 2> "$f.err"; e=$?
  echo "$e" > "$f.exit"
  printf '[%02d] exit %s: %s\n' "$N" "$e" "$1"
  return 0
}
# design §3.4: pass is exit 0 and no failure marker in stdout or stderr.
MARKERS='btree node read error|checksum error|, fixing|, continuing|errors this recovery:|paths damaged by fsck:|errors fixed|error in recovery:|emergency read only|- rewinding|Error: '
judge() {
  r "bcachefs fsck -n -K $1 < /dev/null"
  e=$(cat "$f.exit"); m=$(cat "$f.out" "$f.err" | grep -E -o "$MARKERS" | sort -u | tr '\n' ';')
  if [ "$e" = 0 ] && [ -z "$m" ]; then v=PASS; else v=FAIL; fi
  printf '[%02d] VERDICT %s %s exit=%s markers=%s\n' "$N" "$v" "$1" "$e" "$m" | tee -a "$R/verdicts.txt"
}
