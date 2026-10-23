# Which sweep volumes upstream's fsck -n commits anything on: the journal
# sequence its clean shutdown reports, 2 when it changed nothing.
set -u
cd ~bb/b4; R=$PWD/logs/sweep; rm -rf "$R"; mkdir -p "$R"; . ~bb/b4/lib.sh
exec < /dev/null
cd sweep
for img in *.img; do
  r "timeout 120 bcachefs fsck -n -K $img < /dev/null; echo status \$?"
  printf '%s %s %s\n' "$img" "$(tail -1 $f.out)" "$(grep -o 'clean shutdown complete, journal seq [0-9]*' $f.err | grep -o '[0-9]*$')" >> "$R/seq.txt"
done
