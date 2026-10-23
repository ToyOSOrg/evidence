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
# design §3.4 as amended for crash images: a crash inside a superblock
# rewrite tears that copy. Beside judge's rule, an image passes when fsck's
# status is 0, its only marker is the checksum error, every checksum error
# names the copy the crash point lies inside (from $1.torn, which the
# harness writes: copies, inflight, whole), and every other copy is whole.
judge_torn() {
  r "bcachefs fsck -n -K $1 < /dev/null"
  e=$(cat "$f.exit"); m=$(cat "$f.out" "$f.err" | grep -E -o "$MARKERS" | sort -u | tr '\n' ';')
  side="${1%.img}.torn"
  copies=$(sed -n 's/^copies //p' "$side"); inflight=$(sed -n 's/^inflight //p' "$side"); whole=$(sed -n 's/^whole //p' "$side")
  primary=${copies%% *}
  v=FAIL; why=
  if [ "$e" = 0 ] && [ -z "$m" ]; then
    v=PASS
  elif [ "$e" = 0 ] && [ "$m" = "checksum error;" ]; then
    named=$(cat "$f.out" "$f.err" | grep "checksum error" | sed -n -e "s/.*primary superblock unreadable: checksum error.*/$primary/p" -e 's/.*sb @ \([0-9]*\): checksum error.*/\1/p' | sort -u | tr '\n' ' ')
    lines=$(cat "$f.out" "$f.err" | grep -c "checksum error")
    known=$(cat "$f.out" "$f.err" | grep "checksum error" | grep -c -E "primary superblock unreadable: checksum error|sb @ [0-9]+: checksum error")
    others=$(for c in $copies; do [ "$c" = "$inflight" ] || echo "$c"; done | tr '\n' ' ')
    allwhole=yes; for c in $others; do case " $whole " in *" $c "*) ;; *) allwhole=no ;; esac; done
    if [ "$lines" = "$known" ] && [ -n "$inflight" ] && [ "$named" = "$inflight " ] && [ "$allwhole" = yes ]; then
      v=PASS; why="torn copy $inflight, the crash point's"
    else
      why="checksum error on copies [$named] with the crash inside [$inflight], whole [$whole]"
    fi
  fi
  printf '[%02d] VERDICT %s %s exit=%s markers=%s %s\n' "$N" "$v" "$1" "$e" "$m" "$why" | tee -a "$R/verdicts.txt"
}
