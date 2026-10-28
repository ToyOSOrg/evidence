# Run on the bench's Ubuntu after each cycle: ssh <bench> 'bash -s' < check.sh
# Prints SCRATCH=PRESENT|ABSENT first; the rest is the evidence for the record.
T=51cc09f9-7442-435b-bc03-0fd8718b0fb5
scratch() { lsblk -nrpo NAME,PARTTYPE | awk -v t="$T" 'tolower($2)==t {print $1}'; }
sudo -n udevadm settle --timeout=180
waited=0
while [ -z "$(scratch)" ] && [ "$waited" -lt 30 ]; do sleep 1; waited=$((waited + 1)); done
part=$(scratch)
if [ "$(printf '%s\n' "$part" | grep -c .)" -eq 1 ]; then
  echo "SCRATCH=PRESENT $part after ${waited}s (boot $(cat /proc/sys/kernel/random/boot_id | cut -c1-8), up $(cut -d' ' -f1 /proc/uptime) s)"
  disk=$(lsblk -ndpo PKNAME "$part")
  lsblk -ndo TRAN,RM,SIZE,MODEL "$disk"
  sudo -n dd if="$part" of=/dev/null bs=1M count=16 iflag=direct status=none && echo "read 16 MiB: ok" || echo "read 16 MiB: FAILED"
else
  echo "SCRATCH=ABSENT after ${waited}s (found: ${part:-none}) (boot $(cat /proc/sys/kernel/random/boot_id | cut -c1-8))"
fi
echo "--- lsusb"; lsusb | grep -i "0781:" ; lsusb -t
echo "--- portsc"
# Every port: a stick hung as the AMD's was reads as an empty port does.
sudo -n sh -c 'for p in /sys/kernel/debug/usb/xhci/*/ports/port*/portsc; do printf "%s %s\n" "$p" "$(cat "$p")"; done'
echo "--- kernel usb lines this boot"
sudo -n journalctl -k -b 0 --no-pager -o short-monotonic | grep -E "usb [0-9]+-[0-9.]+:|xhci_hcd|usb-storage|sd [0-9]+:[0-9]+:[0-9]+:[0-9]+:|I/O error|error -" | tail -60
