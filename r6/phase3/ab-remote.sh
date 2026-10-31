#!/bin/bash
# T14 Linux, as root, from a systemd unit (step A3 drops the I219 and with it ssh).
# Usage: ab-remote.sh runtime   (boot A: the normal boot, i915 loaded)
#        ab-remote.sh nomodeset (boot B: booted once with `nomodeset`)
# Binary: /var/tmp/osbench-scout, sha256 b108a25ce4f57c74cb6c409bee92a9a955f61682afc4f99c8b901119ac486d2f.
set -u
MODE=$1
W=/var/tmp/ab-$MODE; mkdir -p $W; cd $W
NVME=0000:04:00.0; RP=0000:00:06.0; GBE=0000:00:1f.6
modprobe msr; rfkill block all
mountpoint -q /sys/kernel/debug || mount -t debugfs none /sys/kernel/debug
D=/sys/kernel/debug
# Before a step only what wakes no device: sysfs and the PMC's counters. After
# it, also i915's debugfs and config space, which resume what they read.
light() {  # $1 = label
  {
    echo "== nvme apst"; cat /sys/class/nvme/nvme0/power/pm_qos_latency_tolerance_us
    for f in package_cstate_show slp_s0_residency_usec substate_residencies; do
      echo "== pmc_core/$f"; cat $D/pmc_core/$f 2>&1
    done
  } > $W/$1.state 2>&1
}
capture() {  # $1 = label; everything that says what state the step measured
  {
    echo "== cmdline"; cat /proc/cmdline
    echo "== modules"; lsmod | grep -E '^(i915|e1000e|nvme|intel_pmc_core|intel_vsec)\b'
    echo "== aspm policy"; cat /sys/module/pcie_aspm/parameters/policy
    for d in $RP $NVME $GBE; do echo "== link $d"; grep -H . /sys/bus/pci/devices/$d/link/* 2>&1; done
    echo "== nvme apst"; cat /sys/class/nvme/nvme0/power/pm_qos_latency_tolerance_us
    command -v nvme >/dev/null && { nvme get-feature /dev/nvme0 -f 0x0c -H 2>&1 | head -5; nvme get-feature /dev/nvme0 -f 0x02 -H 2>&1; }
    for f in ltr_show package_cstate_show slp_s0_residency_usec substate_residencies substate_status; do
      echo "== pmc_core/$f"; cat $D/pmc_core/$f 2>&1
    done
    for f in i915_edp_psr_status i915_dmc_info i915_display_info i915_power_domain_info; do
      echo "== dri/0/$f"; cat $D/dri/0/$f 2>&1 | head -80
    done
    echo "== fb0 blank"; cat /sys/class/graphics/fb0/blank 2>&1
  } > $W/$1.state 2>&1
  lspci -vvv > $W/$1.lspci 2>&1
  lspci -xxxx -s ${RP#0000:} > $W/$1.hex 2>&1; lspci -xxxx -s ${NVME#0000:} >> $W/$1.hex 2>&1; lspci -xxxx -s ${GBE#0000:} >> $W/$1.hex 2>&1
}
step() {  # $1 = label
  light $1
  /var/tmp/osbench-scout energy </dev/null > $W/$1.txt 2>&1
  echo "$1 rc=$?" >> $W/progress
  capture $1-after
}
if [ "$MODE" = nomodeset ]; then
  step B0-nomodeset
else
  step A0-base
  apst=$(cat /sys/class/nvme/nvme0/power/pm_qos_latency_tolerance_us)
  echo 0 > /sys/class/nvme/nvme0/power/pm_qos_latency_tolerance_us; step A1-nvme-apst-off
  echo "$apst" > /sys/class/nvme/nvme0/power/pm_qos_latency_tolerance_us
  for f in l1_aspm l1_1_aspm l1_2_aspm; do cat /sys/bus/pci/devices/$NVME/link/$f > $W/aspm-$f.was 2>/dev/null; done
  echo 0 > /sys/bus/pci/devices/$NVME/link/l1_aspm; step A2-nvme-aspm-off
  for f in l1_aspm l1_1_aspm l1_2_aspm; do [ -s $W/aspm-$f.was ] && cat $W/aspm-$f.was > /sys/bus/pci/devices/$NVME/link/$f; done
  echo $GBE > /sys/bus/pci/drivers/e1000e/unbind; step A3-i219-unbound
  echo $GBE > /sys/bus/pci/drivers/e1000e/bind
  echo 0x1 > $D/dri/0/i915_edp_psr_debug; step A4-psr-off
  echo 0x0 > $D/dri/0/i915_edp_psr_debug; step A5-psr-default
  echo 4 > /sys/class/graphics/fb0/blank; step A6-display-off
  echo 0 > /sys/class/graphics/fb0/blank
fi
rfkill unblock all
echo done >> $W/progress
