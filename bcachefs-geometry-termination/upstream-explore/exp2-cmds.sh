cd /
$BC fsck --help 2>&1 | head -3
for img in /images/x4.raw /images/churn.raw; do
  for opts in "nodiscard" "nodiscard,noreconcile_enabled,journal_reclaim_delay=1000000" "norecovery"; do
    $BC fsck -n -f -K -o "$opts" "$img" </dev/null > /fsck.txt 2>&1; ec=$?
    echo "===OPT [$opts] $img exit $ec"
    grep -vE "\.\.\. done|^\[<" /fsck.txt | tail -8
  done
done
