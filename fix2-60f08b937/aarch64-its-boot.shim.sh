#!/bin/sh
# By-hand B5 measurement: log cargo run's own argv, change only the -machine
# value of the launch, and exec the real QEMU.
LOG=<path>
REAL=/opt/homebrew/bin/qemu-system-aarch64
echo "cargo run's argv: $*" >> "$LOG"
case " $* " in
  *" -machine virt,gic-version=3,iommu=smmuv3 "*) ;;
  *) exec "$REAL" "$@" ;;
esac
out=""
set -- "$@" --end--
while [ "$1" != "--end--" ]; do
  if [ "$prev" = "-machine" ]; then a="virt,gic-version=3,its=on,iommu=smmuv3,kernel-irqchip=off"; else a="$1"; fi
  prev="$1"; shift; set -- "$@" "$a"
done
shift
echo "launched argv: $*" >> "$LOG"
exec "$REAL" "$@"
