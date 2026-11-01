## AMD_Ryzen_7_4800U_with_Radeon_Graphics

Runs: Linux 1, ToyOS 1. lan.peer_link: none. internet.link: none.

Linux setup: kernel=6.8.0-147-generic, cpufreq_driver=acpi-cpufreq*16, governor=schedutil*16, epp=absent*16, min_khz=1400000*16, max_khz=1800000*16, boost=1, intel_no_turbo=absent, platform_profile=balanced, smt_active=1, energy.display=card1-eDP-1:On, energy.backlight=amdgpu_bl1:255/255, energy.radios=rfkill0:bluetooth_blocked,rfkill1:wlan_blocked, energy.links=tailscale0:unknown,wlp1s0:down.

Linux per run: clocksource=hpet.

| bench | unit | Linux p50s | Linux median | Linux range | ToyOS p50s | ToyOS median | ToyOS range | ToyOS/Linux | p | verdict |
|---|---|---|---|---|---|---|---|---|---|---|
| cpu.clock | MHz | 1372 | 1372 | 0.0% | 4217 | 4217 | 0.0% | 3.07 | 1.000 | too few runs to resolve (least p 1.000) |
| energy.idle.package | mW | 1478 | 1478 | 0.0% | 1720 | 1720 | 0.0% | 1.16 | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.all.package | mW | 31076 | 31076 | 0.0% | 31143 | 31143 | 0.0% | 1.00 | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.all.per_chunk | nJ | 6136 | 6136 | 0.0% | 5995 | 5995 | 0.0% | 0.98 | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.t1.package | mW | 6903 | 6903 | 0.0% | 7445 | 7445 | 0.0% | 1.08 | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.t1.per_chunk | nJ | 20331 | 20331 | 0.0% | 21661 | 21661 | 0.0% | 1.07 | 1.000 | too few runs to resolve (least p 1.000) |
| energy.wake_10ms.package | mW | 1395 | 1395 | 0.0% | 1735 | 1735 | 0.0% | 1.24 | 1.000 | too few runs to resolve (least p 1.000) |

Each p is its row's alone, uncorrected for the table's other rows.

