# Linux on the T14: is the 2.2 s SMI there, idle, in ACPI mode?

Read-only. Uses only `sudo -n dd` (reads of the msr device and of /dev/port; nothing is written).
MSR_SMI_COUNT is MSR 0x34 = byte offset 52 of /dev/cpu/N/msr. PM1a_CNT is port 0x1804 (FADT
PM1a block 0x1800 + 4 on this machine), SCI_EN its bit 0. SMI_EN is port 0x1830.

Run on an idle Linux (nothing else started), one session:

```
ssh <t14> 'set -e
ls -l /dev/cpu/0/msr
rd() { for c in 0 1 2 3 4 5 6 7; do printf "cpu%s=%s " $c "$(sudo -n dd if=/dev/cpu/$c/msr bs=8 count=1 skip=52 iflag=skip_bytes status=none | od -An -tu8 | tr -d " ")"; done; echo; }
printf "PM1a_CNT "; sudo -n dd if=/dev/port bs=1 skip=$((0x1804)) count=2 status=none | od -An -tx1
printf "SMI_EN   "; sudo -n dd if=/dev/port bs=1 skip=$((0x1830)) count=4 status=none | od -An -tx1
date +%s.%N; rd
sleep 60
date +%s.%N; rd' > linux-smi-idle.txt 2>&1; echo exit=$?
```

If `/dev/cpu/0/msr` is absent the msr module is not loaded, and loading it is outside `sudo -n dd`;
then report that and stop (the #681 reading, `perf stat -a -A -e msr/smi/` 0 over 120.378 s under
`rtla timerlat`, stays the only Linux reading).

Expected if the cause is legacy mode: PM1a_CNT low byte odd (SCI_EN set) and every CPU's count equal
before and after the 60 s. A rise of ~27 would refute "Linux has no periodic SMI" for idle Linux.
