## 11th_Gen_Intel(R)_Core(TM)_i5-1135G7_@_2.40GHz

Runs: Linux 1, ToyOS 1. lan.peer_link: none. internet.link: none.

Linux setup: kernel=6.8.0-147-generic, cpufreq_driver=intel_pstate*8, governor=powersave*8, epp=balance_performance*8, min_khz=400000*8, max_khz=4200000*8, boost=absent, intel_no_turbo=0, platform_profile=balanced, smt_active=1, energy.display=card1-eDP-1:On, energy.backlight=intel_backlight:6310/19393, energy.radios=rfkill0:bluetooth_blocked,rfkill2:wlan_blocked, energy.links=enp0s31f6:up,<vpn>:unknown,wlp9s0:down.

Linux per run: clocksource=tsc.

| bench | unit | Linux p50s | Linux median | Linux range | ToyOS p50s | ToyOS median | ToyOS range | ToyOS/Linux | p | verdict |
|---|---|---|---|---|---|---|---|---|---|---|
| cpu.clock | MHz | 4190 | 4190 | 0.0% | 3790 | 3790 | 0.0% | 0.90 | 1.000 | too few runs to resolve (least p 1.000) |
| energy.idle.package | mW | 1473 | 1473 | 0.0% | 7015 | 7015 | 0.0% | 4.76 | 1.000 | too few runs to resolve (least p 1.000) |
| energy.idle.pc2 | permille | 99 | 99 | 0.0% | 994 | 994 | 0.0% | 10.04 | 1.000 | too few runs to resolve (least p 1.000) |
| energy.idle.pc3 | permille | 0 | 0 | - | 0 | 0 | - | NaN | 1.000 | too few runs to resolve (least p 1.000) |
| energy.idle.pc6 | permille | 21 | 21 | 0.0% | 0 | 0 | - | 0.00 | 1.000 | too few runs to resolve (least p 1.000) |
| energy.idle.pc7 | permille | 1 | 1 | 0.0% | 0 | 0 | - | 0.00 | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.all.package | mW | 8026 | 8026 | 0.0% | 18264 | 18264 | 0.0% | 2.28 | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.all.pc2 | permille | 0 | 0 | - | 0 | 0 | - | NaN | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.all.pc3 | permille | 0 | 0 | - | 0 | 0 | - | NaN | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.all.pc6 | permille | 0 | 0 | - | 0 | 0 | - | NaN | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.all.pc7 | permille | 0 | 0 | - | 0 | 0 | - | NaN | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.all.per_chunk | nJ | 23745 | 23745 | 0.0% | 7525 | 7525 | 0.0% | 0.32 | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.t1.package | mW | 7996 | 7996 | 0.0% | 8351 | 8351 | 0.0% | 1.04 | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.t1.pc2 | permille | 0 | 0 | - | 0 | 0 | - | NaN | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.t1.pc3 | permille | 0 | 0 | - | 0 | 0 | - | NaN | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.t1.pc6 | permille | 0 | 0 | - | 0 | 0 | - | NaN | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.t1.pc7 | permille | 0 | 0 | - | 0 | 0 | - | NaN | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.t1.per_chunk | nJ | 23658 | 23658 | 0.0% | 24696 | 24696 | 0.0% | 1.04 | 1.000 | too few runs to resolve (least p 1.000) |
| energy.wake_10ms.package | mW | 1183 | 1183 | 0.0% | 2889 | 2889 | 0.0% | 2.44 | 1.000 | too few runs to resolve (least p 1.000) |
| energy.wake_10ms.pc2 | permille | 129 | 129 | 0.0% | 927 | 927 | 0.0% | 7.19 | 1.000 | too few runs to resolve (least p 1.000) |
| energy.wake_10ms.pc3 | permille | 0 | 0 | - | 0 | 0 | - | NaN | 1.000 | too few runs to resolve (least p 1.000) |
| energy.wake_10ms.pc6 | permille | 17 | 17 | 0.0% | 0 | 0 | - | 0.00 | 1.000 | too few runs to resolve (least p 1.000) |
| energy.wake_10ms.pc7 | permille | 4 | 4 | 0.0% | 0 | 0 | - | 0.00 | 1.000 | too few runs to resolve (least p 1.000) |

Each p is its row's alone, uncorrected for the table's other rows.

## AMD_Ryzen_7_4800U_with_Radeon_Graphics

Runs: Linux 1, ToyOS 1. lan.peer_link: none. internet.link: none.

Linux setup: kernel=6.8.0-147-generic, cpufreq_driver=acpi-cpufreq*16, governor=schedutil*16, epp=absent*16, min_khz=1400000*16, max_khz=1800000*16, boost=1, intel_no_turbo=absent, platform_profile=balanced, smt_active=1, energy.display=card1-eDP-1:On, energy.backlight=amdgpu_bl1:255/255, energy.radios=rfkill0:bluetooth_blocked,rfkill1:wlan_blocked, energy.links=<vpn>:unknown,wlp1s0:down.

Linux per run: clocksource=hpet.

| bench | unit | Linux p50s | Linux median | Linux range | ToyOS p50s | ToyOS median | ToyOS range | ToyOS/Linux | p | verdict |
|---|---|---|---|---|---|---|---|---|---|---|
| cpu.clock | MHz | 1370 | 1370 | 0.0% | 4266 | 4266 | 0.0% | 3.11 | 1.000 | too few runs to resolve (least p 1.000) |
| energy.idle.package | mW | 1357 | 1357 | 0.0% | 1555 | 1555 | 0.0% | 1.15 | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.all.package | mW | 6860 | 6860 | 0.0% | 31252 | 31252 | 0.0% | 4.56 | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.all.per_chunk | nJ | 20210 | 20210 | 0.0% | 6002 | 6002 | 0.0% | 0.30 | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.t1.package | mW | 6795 | 6795 | 0.0% | 6848 | 6848 | 0.0% | 1.01 | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.t1.per_chunk | nJ | 20017 | 20017 | 0.0% | 19925 | 19925 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 1.000) |
| energy.wake_10ms.package | mW | 1372 | 1372 | 0.0% | 1709 | 1709 | 0.0% | 1.25 | 1.000 | too few runs to resolve (least p 1.000) |

Each p is its row's alone, uncorrected for the table's other rows.

