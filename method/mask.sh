# usage: sh mask.sh <bench> < osbench lines > masked lines
# Drops the identity group whole (PCI, USB, DMI and NVMe identity), and masks the CPU model, the disk model,
# local paths and addresses. The bench name stands for the machine.
awk '/group=identity start/{skip=1} !skip{print} /group=identity done/{skip=0}' | sed -E \
  -e "s#cpu_model=[^ ]*#cpu_model=$1-bench-cpu#g" \
  -e 's#model_[^ ,]*((_[^ ,]*)*)#model_masked#g' -e 's#\.model=[^ ]*#.model=masked#g' \
  -e 's#limit_from=[^ ]*#limit_from=the_vendor_specification_masked#g' \
  -e 's#/Users/[^/[:space:]]+#<home>#g' -e 's#/home/[^/[:space:]]+#<home>#g' \
  -e 's#([0-9A-Fa-f]{2}[:-]){5}[0-9A-Fa-f]{2}#<mac>#g' \
  -e 's#([0-9]{1,3}\.){3}[0-9]{1,3}#<ip>#g' \
  -e 's#toyos@[A-Za-z0-9.-]+#<bench>#g'
