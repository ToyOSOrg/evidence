## 11th_Gen_Intel(R)_Core(TM)_i5-1135G7_@_2.40GHz

Runs: Linux 4, ToyOS 4. lan.peer_link: wireless driver=iwlwifi. internet.link: none.

| bench | unit | Linux p50s | Linux median | Linux range | ToyOS p50s | ToyOS median | ToyOS range | ToyOS/Linux | p | verdict |
|---|---|---|---|---|---|---|---|---|---|---|
| cpu.clock | MHz | 4185, 4186, 4185, 4186 | 4186 | 0.0% | 3788, 3787, 3788, 3787 | 3788 | 0.0% | 0.90 | 0.029 | ToyOS lower |
| lan.wifi.tcp.connect |  |  | - | - |  | - | - | - | - | Linux 4 run(s) unmeasured: this_run_reached_its_peer_over_its_wired_link; ToyOS 4 run(s) unsupported: ToyOS_has_no_Wi-Fi_driver:_issues/there-is-no-wifi.md |
| lan.wifi.tcp.download |  |  | - | - |  | - | - | - | - | Linux 4 run(s) unmeasured: this_run_reached_its_peer_over_its_wired_link; ToyOS 4 run(s) unsupported: ToyOS_has_no_Wi-Fi_driver:_issues/there-is-no-wifi.md |
| lan.wifi.tcp.rtt.64 |  |  | - | - |  | - | - | - | - | Linux 4 run(s) unmeasured: this_run_reached_its_peer_over_its_wired_link; ToyOS 4 run(s) unsupported: ToyOS_has_no_Wi-Fi_driver:_issues/there-is-no-wifi.md |
| lan.wifi.tcp.upload |  |  | - | - |  | - | - | - | - | Linux 4 run(s) unmeasured: this_run_reached_its_peer_over_its_wired_link; ToyOS 4 run(s) unsupported: ToyOS_has_no_Wi-Fi_driver:_issues/there-is-no-wifi.md |
| lan.wired.tcp.connect | ns | 1963532, 1898795, 1090394, 1133754 | 1516274 | 57.6% | 2983069, 2808109, 2933029, 3001533 | 2958049 | 6.5% | 1.95 | 0.029 | ToyOS worse |
| lan.wired.tcp.download | MB/s | 114, 113, 114, 111 | 114 | 2.6% | 111, 111, 113, 113 | 112 | 1.8% | 0.99 | 0.400 | too few runs to resolve (least p 0.086) |
| lan.wired.tcp.rtt.64 | ns | 2027411, 2026966, 2005855, 2001880 | 2016410 | 1.3% | 1995373, 2000628, 2000681, 1505353 | 1998000 | 24.8% | 0.99 | 0.029 | ToyOS better |
| lan.wired.tcp.upload | MB/s | 113, 113, 112, 112 | 112 | 0.9% | 58, 61, 59, 57 | 58 | 6.8% | 0.52 | 0.029 | ToyOS worse |

Each p is its row's alone, uncorrected for the table's other rows.

