## 11th_Gen_Intel(R)_Core(TM)_i5-1135G7_@_2.40GHz

Runs: Linux 1, ToyOS 1. lan.peer_link: none. internet.link: none.

Linux setup: kernel=6.8.0-147-generic, cpufreq_driver=intel_pstate*8, governor=powersave*8, epp=balance_performance*8, min_khz=400000*8, max_khz=4200000*8, boost=absent, intel_no_turbo=0, platform_profile=balanced, smt_active=1, energy.display=card1-eDP-1:On, energy.backlight=intel_backlight:6310/19393, energy.radios=rfkill0:bluetooth_blocked,rfkill2:wlan_blocked, energy.links=enp0s31f6:up,tailscale0:unknown,wlp9s0:down.

Linux per run: clocksource=tsc.

| bench | unit | Linux p50s | Linux median | Linux range | ToyOS p50s | ToyOS median | ToyOS range | ToyOS/Linux | p | verdict |
|---|---|---|---|---|---|---|---|---|---|---|
| cpu.clock | MHz | 4156 | 4156 | 0.0% | 3790 | 3790 | 0.0% | 0.91 | 1.000 | too few runs to resolve (least p 1.000) |
| energy.idle.package | mW | 1650 | 1650 | 0.0% | 6498 | 6498 | 0.0% | 3.94 | 1.000 | too few runs to resolve (least p 1.000) |
| energy.idle.pc2 | permille | 101 | 101 | 0.0% | 994 | 994 | 0.0% | 9.84 | 1.000 | too few runs to resolve (least p 1.000) |
| energy.idle.pc3 | permille | 0 | 0 | - | 0 | 0 | - | NaN | 1.000 | too few runs to resolve (least p 1.000) |
| energy.idle.pc6 | permille | 22 | 22 | 0.0% | 0 | 0 | - | 0.00 | 1.000 | too few runs to resolve (least p 1.000) |
| energy.idle.pc7 | permille | 3 | 3 | 0.0% | 0 | 0 | - | 0.00 | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.all.package | mW | 9807 | 9807 | 0.0% | 18351 | 18351 | 0.0% | 1.87 | 1.000 | too few runs to resolve (least p 1.000); the clock fell in 1 of 1 Linux run(s) |
| energy.spin.all.pc2 | permille | 0 | 0 | - | 0 | 0 | - | NaN | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.all.pc3 | permille | 0 | 0 | - | 0 | 0 | - | NaN | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.all.pc6 | permille | 0 | 0 | - | 0 | 0 | - | NaN | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.all.pc7 | permille | 0 | 0 | - | 0 | 0 | - | NaN | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.all.per_chunk | nJ | 5762 | 5762 | 0.0% | 7562 | 7562 | 0.0% | 1.31 | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.t1.package | mW | 8457 | 8457 | 0.0% | 8386 | 8386 | 0.0% | 0.99 | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.t1.pc2 | permille | 0 | 0 | - | 0 | 0 | - | NaN | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.t1.pc3 | permille | 0 | 0 | - | 0 | 0 | - | NaN | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.t1.pc6 | permille | 0 | 0 | - | 0 | 0 | - | NaN | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.t1.pc7 | permille | 0 | 0 | - | 0 | 0 | - | NaN | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.t1.per_chunk | nJ | 25030 | 25030 | 0.0% | 24796 | 24796 | 0.0% | 0.99 | 1.000 | too few runs to resolve (least p 1.000) |
| energy.wake_10ms.package | mW | 1266 | 1266 | 0.0% | 2924 | 2924 | 0.0% | 2.31 | 1.000 | too few runs to resolve (least p 1.000) |
| energy.wake_10ms.pc2 | permille | 130 | 130 | 0.0% | 928 | 928 | 0.0% | 7.14 | 1.000 | too few runs to resolve (least p 1.000) |
| energy.wake_10ms.pc3 | permille | 0 | 0 | - | 0 | 0 | - | NaN | 1.000 | too few runs to resolve (least p 1.000) |
| energy.wake_10ms.pc6 | permille | 19 | 19 | 0.0% | 0 | 0 | - | 0.00 | 1.000 | too few runs to resolve (least p 1.000) |
| energy.wake_10ms.pc7 | permille | 5 | 5 | 0.0% | 0 | 0 | - | 0.00 | 1.000 | too few runs to resolve (least p 1.000) |

Each p is its row's alone, uncorrected for the table's other rows.

