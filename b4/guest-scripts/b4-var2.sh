# The AArch64 tree's threshold between 28 and 64 free buckets, and the
# x86-64 tree rewritten with none, twice, each with a 120 s ceiling.
set -u
cd ~bb/b4; R=$PWD/logs/var2; rm -rf "$R"; mkdir -p "$R"; . ~bb/b4/lib.sh
exec < /dev/null
for v in var2/v32 var2/v36 var2/v40 var2/v48 var2/v56 varx/v0 varx/v0; do
  r "timeout 120 bcachefs fsck -n -K img/$v.img < /dev/null; echo status \$?"
  printf '%s: %s\n' "$v" "$(tail -1 $f.out)" | tee -a "$R/verdicts.txt"
done
