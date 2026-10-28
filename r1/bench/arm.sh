# The Linux arms. Run: ssh <bench> 'bash -s -- <idle|restart|sysrq>' < arm.sh
# idle:    restart, scratch stick not written.
# restart: write the scratch partition with dd (direct, synced writes), and once
#          64 MiB are written, `systemctl reboot` with dd still writing.
# sysrq:   the same, but reset at once with no device shutdown (sysrq b),
#          the closest Linux reset to ToyOS's deadline reset. Syncs first.
set -u
mode=$1
T=51cc09f9-7442-435b-bc03-0fd8718b0fb5
part=$(lsblk -nrpo NAME,PARTTYPE | awk -v t="$T" 'tolower($2)==t {print $1}')
[ "$(printf '%s\n' "$part" | grep -c .)" -eq 1 ] || { echo "REFUSED: not exactly one scratch partition: '${part}'"; exit 1; }
disk=$(lsblk -ndpo PKNAME "$part")
[ "$(lsblk -ndo TRAN,RM "$disk" | tr -s ' ')" = "usb 1" ] || { echo "REFUSED: $disk is no removable USB disk"; exit 1; }
[ "$(lsblk -nrpo NAME "$disk" | grep -c .)" -eq 2 ] || { echo "REFUSED: $disk holds more than its scratch partition"; exit 1; }
case "$mode" in
  idle) echo "restarting, $part idle"; sudo -n systemctl reboot; exit 0 ;;
  restart|sysrq) ;;
  *) echo "REFUSED: mode $mode"; exit 2 ;;
esac
sudo -n sh -c "nohup dd if=/dev/urandom of='$part' bs=1M oflag=direct,dsync status=none >/dev/null 2>&1 & echo \$! > /run/scratch-dd.pid"
pid=$(sudo -n cat /run/scratch-dd.pid)
waited=0
while :; do
  w=$(sudo -n awk '/^write_bytes/ {print $2}' "/proc/$pid/io" 2>/dev/null || echo gone)
  [ "$w" = gone ] && { echo "FAILED: dd ended before 64 MiB"; exit 1; }
  [ "$w" -ge 67108864 ] && break
  [ "$waited" -ge 120 ] && { echo "FAILED: dd wrote $w bytes in 120 s"; sudo -n kill "$pid"; exit 1; }
  sleep 1; waited=$((waited + 1))
done
echo "dd has written $w bytes to $part in ${waited}s; $mode now, with dd writing"
case "$mode" in
  restart) sudo -n systemctl reboot ;;
  sysrq) sync; sudo -n sh -c 'echo b > /proc/sysrq-trigger' ;;
esac
