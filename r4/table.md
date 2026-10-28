## 11th_Gen_Intel(R)_Core(TM)_i5-1135G7_@_2.40GHz

Runs: Linux 4, ToyOS 4. lan.peer_link: none. internet.link: none.

Linux setup: kernel=6.8.0-147-generic, cpufreq_driver=intel_pstate*8, governor=powersave*8, epp=balance_performance*8, min_khz=400000*8, max_khz=4200000*8, boost=absent, intel_no_turbo=0, platform_profile=balanced, smt_active=1, energy.display=card1-eDP-1:On, energy.backlight=intel_backlight:6310/19393, energy.radios=rfkill0:bluetooth_blocked,rfkill2:wlan_blocked, energy.links=enp0s31f6:up,<vpn>:unknown,wlp9s0:down.

Linux per run: clocksource=tsc,tsc,tsc,tsc.

| bench | unit | Linux p50s | Linux median | Linux range | ToyOS p50s | ToyOS median | ToyOS range | ToyOS/Linux | p | verdict |
|---|---|---|---|---|---|---|---|---|---|---|
| cpu.clock | MHz | 4190, 4190, 4100, 4327 | 4190 | 5.4% | 3790, 3790, 3790, 3790 | 3790 | 0.0% | 0.90 | 0.029 | ToyOS lower |
| energy.idle.package | mW | 1760, 1697, 1596, 1599 | 1648 | 10.0% | 7146, 6560, 7128, 7220 | 7137 | 9.2% | 4.33 | 0.029 | ToyOS higher |
| energy.idle.pc2 | permille | 99, 103, 100, 104 | 102 | 4.9% | 994, 994, 994, 994 | 994 | 0.0% | 9.79 | 0.029 | ToyOS higher |
| energy.idle.pc3 | permille | 0, 0, 0, 0 | 0 | - | 0, 0, 0, 0 | 0 | - | NaN | 1.000 | too few runs to resolve (least p 1.000) |
| energy.idle.pc6 | permille | 20, 21, 22, 21 | 21 | 9.5% | 0, 0, 0, 0 | 0 | - | 0.00 | 0.029 | ToyOS lower |
| energy.idle.pc7 | permille | 2, 2, 3, 2 | 2 | 50.0% | 0, 0, 0, 0 | 0 | - | 0.00 | 0.029 | ToyOS lower |
| energy.spin.all.package | mW | 18052, 18203, 18235, 9776 | 18128 | 46.7% | 18172, 18117, 18230, 18202 | 18187 | 0.6% | 1.00 | 0.886 | not resolved; the clock fell in 1 of 4 Linux run(s) |
| energy.spin.all.pc2 | permille | 0, 0, 0, 0 | 0 | - | 0, 0, 0, 0 | 0 | - | NaN | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.all.pc3 | permille | 0, 0, 0, 0 | 0 | - | 0, 0, 0, 0 | 0 | - | NaN | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.all.pc6 | permille | 0, 0, 0, 0 | 0 | - | 0, 0, 0, 0 | 0 | - | NaN | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.all.pc7 | permille | 0, 0, 0, 0 | 0 | - | 0, 0, 0, 0 | 0 | - | NaN | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.all.per_chunk | nJ | 7445, 7508, 7520, 5680 | 7476 | 24.6% | 7490, 7469, 7514, 7504 | 7497 | 0.6% | 1.00 | 0.886 | not resolved |
| energy.spin.t1.package | mW | 8121, 8197, 8198, 8206 | 8198 | 1.0% | 8305, 8343, 8193, 8398 | 8324 | 2.5% | 1.02 | 0.200 | not resolved |
| energy.spin.t1.pc2 | permille | 0, 0, 0, 0 | 0 | - | 0, 0, 0, 0 | 0 | - | NaN | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.t1.pc3 | permille | 0, 0, 0, 0 | 0 | - | 0, 0, 0, 0 | 0 | - | NaN | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.t1.pc6 | permille | 0, 0, 0, 0 | 0 | - | 0, 0, 0, 0 | 0 | - | NaN | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.t1.pc7 | permille | 0, 0, 0, 0 | 0 | - | 0, 0, 0, 0 | 0 | - | NaN | 1.000 | too few runs to resolve (least p 1.000) |
| energy.spin.t1.per_chunk | nJ | 24029, 24261, 24262, 24283 | 24262 | 1.0% | 24563, 24673, 24229, 24839 | 24618 | 2.5% | 1.01 | 0.200 | not resolved |
| energy.wake_10ms.package | mW | 1228, 1219, 1204, 1219 | 1219 | 2.0% | 2868, 2857, 2867, 2859 | 2863 | 0.4% | 2.35 | 0.029 | ToyOS higher |
| energy.wake_10ms.pc2 | permille | 130, 131, 129, 129 | 130 | 1.5% | 926, 927, 926, 926 | 926 | 0.1% | 7.15 | 0.029 | ToyOS higher |
| energy.wake_10ms.pc3 | permille | 0, 0, 0, 0 | 0 | - | 0, 0, 0, 0 | 0 | - | NaN | 1.000 | too few runs to resolve (least p 1.000) |
| energy.wake_10ms.pc6 | permille | 17, 18, 18, 18 | 18 | 5.6% | 0, 0, 0, 0 | 0 | - | 0.00 | 0.029 | ToyOS lower |
| energy.wake_10ms.pc7 | permille | 5, 6, 6, 5 | 6 | 18.2% | 0, 0, 0, 0 | 0 | - | 0.00 | 0.029 | ToyOS lower |

Each p is its row's alone, uncorrected for the table's other rows.

## AMD_Ryzen_7_4800U_with_Radeon_Graphics

Runs: Linux 4, ToyOS 4. lan.peer_link: none. internet.link: none.

Linux setup: kernel=6.8.0-147-generic, cpufreq_driver=acpi-cpufreq*16, governor=schedutil*16, epp=absent*16, min_khz=1400000*16, max_khz=1800000*16, boost=1, intel_no_turbo=absent, platform_profile=balanced, smt_active=1, energy.display=card1-eDP-1:On, energy.backlight=amdgpu_bl1:255/255, energy.radios=rfkill0:bluetooth_blocked,rfkill1:wlan_blocked, energy.links=<vpn>:unknown,wlp1s0:down.

Linux per run: clocksource=tsc,hpet,hpet,hpet.

| bench | unit | Linux p50s | Linux median | Linux range | ToyOS p50s | ToyOS median | ToyOS range | ToyOS/Linux | p | verdict |
|---|---|---|---|---|---|---|---|---|---|---|
| cpu.clock | MHz | 4291, 1370, 1387, 1370 | 1378 | 211.9% | 4266, 4241, 4242, 4241 | 4242 | 0.6% | 3.08 | 0.286 | too few runs to resolve (least p 0.057) |
| energy.idle.package | mW | 1456, 1403, 1487, 1572 | 1472 | 11.5% | 1684, 1686, 1690, 1692 | 1688 | 0.5% | 1.15 | 0.029 | ToyOS higher |
| energy.spin.all.package | mW | 31808, 31699, 31653, 31612 | 31676 | 0.6% | 31309, 31253, 31255, 31201 | 31254 | 0.3% | 0.99 | 0.029 | ToyOS lower |
| energy.spin.all.per_chunk | nJ | 6093, 6168, 6164, 6164 | 6164 | 1.2% | 6006, 5999, 6007, 5998 | 6002 | 0.1% | 0.97 | 0.029 | ToyOS lower |
| energy.spin.t1.package | mW | 6067, 6821, 6848, 6876 | 6834 | 11.8% | 6801, 6799, 6827, 6851 | 6814 | 0.8% | 1.00 | 0.886 | not resolved |
| energy.spin.t1.per_chunk | nJ | 17692, 20099, 20176, 20259 | 20138 | 12.7% | 19791, 19781, 19864, 19934 | 19828 | 0.8% | 0.98 | 0.343 | not resolved |
| energy.wake_10ms.package | mW | 1537, 1391, 1452, 1705 | 1494 | 21.0% | 1700, 1700, 1707, 1710 | 1704 | 0.6% | 1.14 | 0.114 | too few runs to resolve (least p 0.057) |

Each p is its row's alone, uncorrected for the table's other rows.

