# Which of the AArch64 ROOT's tree, rewritten with 0, 1, 8, 28 and 64 free
# buckets, upstream's fsck finishes, each with a 120 s ceiling.
set -u
cd ~bb/b4; R=$PWD/logs/var; rm -rf "$R"; mkdir -p "$R"; . ~bb/b4/lib.sh
exec < /dev/null
cd img/var
for v in v0 v1 v8 v28 v64; do
  r "timeout 120 bcachefs fsck -n -K $v.img < /dev/null; echo status \$?"
  printf '%s: %s\n' "$v" "$(tail -1 $f.out)" | tee -a "$R/verdicts.txt"
done
