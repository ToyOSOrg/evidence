# A FUSE daemon still running 120 s after its unmount is stopped with TERM,
# as B3's hang script does; each stop is logged.
while pgrep -f b3r/ > /dev/null; do
  if ! mount | grep -q /mnt/t; then
    for p in $(pgrep -x bcachefs); do
      e=$(ps -o etimes= -p $p | tr -d ' ')
      if [ -n "$e" ] && [ "$e" -gt 120 ] && ! mount | grep -q /mnt/t; then
        sleep 120; mount | grep -q /mnt/t || { echo "$(date -u +%T) TERM $(ps -o args= -p $p)" >> ~bb/b3r/ceiling.log; kill -TERM $p; }
      fi
    done
  fi
  sleep 10
done
