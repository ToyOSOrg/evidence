## 11th_Gen_Intel(R)_Core(TM)_i5-1135G7_@_2.40GHz

Runs: Linux 4, ToyOS 4. lan.peer_link: wireless driver=iwlwifi. internet.link: none.

| bench | unit | Linux p50s | Linux median | Linux range | ToyOS p50s | ToyOS median | ToyOS range | ToyOS/Linux | p | verdict |
|---|---|---|---|---|---|---|---|---|---|---|
| cpu.clock | MHz | 4186, 4186, 4186, 4186 | 4186 | 0.0% | 3788, 3786, 3787, 3787 | 3787 | 0.1% | 0.90 | 0.029 | ToyOS lower |
| lan.wifi.tcp.connect |  |  | - | - |  | - | - | - | - | Linux 4 run(s) unmeasured: this_run_reached_its_peer_over_its_wired_link; ToyOS 4 run(s) unsupported: ToyOS_has_no_Wi-Fi_driver:_issues/there-is-no-wifi.md |
| lan.wifi.tcp.download |  |  | - | - |  | - | - | - | - | Linux 4 run(s) unmeasured: this_run_reached_its_peer_over_its_wired_link; ToyOS 4 run(s) unsupported: ToyOS_has_no_Wi-Fi_driver:_issues/there-is-no-wifi.md |
| lan.wifi.tcp.rtt.64 |  |  | - | - |  | - | - | - | - | Linux 4 run(s) unmeasured: this_run_reached_its_peer_over_its_wired_link; ToyOS 4 run(s) unsupported: ToyOS_has_no_Wi-Fi_driver:_issues/there-is-no-wifi.md |
| lan.wifi.tcp.upload |  |  | - | - |  | - | - | - | - | Linux 4 run(s) unmeasured: this_run_reached_its_peer_over_its_wired_link; ToyOS 4 run(s) unsupported: ToyOS_has_no_Wi-Fi_driver:_issues/there-is-no-wifi.md |
| lan.wired.tcp.connect | ns | 1610081, 1110905, 1022045, 1082475 | 1096690 | 53.6% | 2972123, 2976823, 2067734, 2995575 | 2974473 | 31.2% | 2.71 | 0.029 | ToyOS worse |
| lan.wired.tcp.download | MB/s | 112, 111, 112, 112 | 112 | 0.9% | 113, 114, 108, 114 | 114 | 5.3% | 1.01 | 0.229 | too few runs to resolve (least p 0.086) |
| lan.wired.tcp.rtt.64 | ns | 2023679, 2010144, 2013131, 2011439 | 2012285 | 0.7% | 1997931, 1993217, 1995372, 1956571 | 1994294 | 2.1% | 0.99 | 0.029 | ToyOS better |
| lan.wired.tcp.upload | MB/s | 111, 110, 112, 112 | 112 | 1.8% | 58, 59, 58, 59 | 58 | 1.7% | 0.52 | 0.029 | ToyOS worse |

Each p is its row's alone, uncorrected for the table's other rows.

