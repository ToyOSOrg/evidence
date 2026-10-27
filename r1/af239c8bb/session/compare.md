## 11th_Gen_Intel(R)_Core(TM)_i5-1135G7_@_2.40GHz

Runs: Linux 4, ToyOS 4. lan.peer_link: wireless driver=iwlwifi. internet.link: none.

| bench | unit | Linux p50s | Linux median | Linux range | ToyOS p50s | ToyOS median | ToyOS range | ToyOS/Linux | p | verdict |
|---|---|---|---|---|---|---|---|---|---|---|
| cpu.clock | MHz | 4195, 4186, 4186, 4186 | 4186 | 0.2% | 3787, 3787, 2592, 3787 | 3787 | 31.6% | 0.90 | 0.029 | ToyOS lower |
| lan.wifi.tcp.connect |  |  | - | - |  | - | - | - | - | Linux 4 run(s) unmeasured: this_run_reached_its_peer_over_its_wired_link; ToyOS 4 run(s) unsupported: ToyOS_has_no_Wi-Fi_driver:_issues/there-is-no-wifi.md |
| lan.wifi.tcp.download |  |  | - | - |  | - | - | - | - | Linux 4 run(s) unmeasured: this_run_reached_its_peer_over_its_wired_link; ToyOS 4 run(s) unsupported: ToyOS_has_no_Wi-Fi_driver:_issues/there-is-no-wifi.md |
| lan.wifi.tcp.rtt.64 |  |  | - | - |  | - | - | - | - | Linux 4 run(s) unmeasured: this_run_reached_its_peer_over_its_wired_link; ToyOS 4 run(s) unsupported: ToyOS_has_no_Wi-Fi_driver:_issues/there-is-no-wifi.md |
| lan.wifi.tcp.upload |  |  | - | - |  | - | - | - | - | Linux 4 run(s) unmeasured: this_run_reached_its_peer_over_its_wired_link; ToyOS 4 run(s) unsupported: ToyOS_has_no_Wi-Fi_driver:_issues/there-is-no-wifi.md |
| lan.wired.tcp.connect | ns | 8030039, 1927876, 2018378, 2009928 | 2014153 | 303.0% | 2999910, 2996433, 2950379, 2972320 | 2984376 | 1.7% | 1.48 | 0.343 | not resolved |
| lan.wired.tcp.download | MB/s | 113, 111, 111, 112 | 112 | 1.8% | 112, 110, 113, 112 | 112 | 2.7% | 1.00 | 1.000 | too few runs to resolve (least p 0.086) |
| lan.wired.tcp.rtt.64 | ns | 2011882, 2009037, 2007988, 2013073 | 2010460 | 0.3% | 1962316, 1998323, 1999984, 1991385 | 1994854 | 1.9% | 0.99 | 0.029 | ToyOS better |
| lan.wired.tcp.upload | MB/s | 112, 112, 111, 112 | 112 | 0.9% | 36, 36, 39, 44 | 38 | 21.3% | 0.33 | 0.029 | ToyOS worse |

Each p is its row's alone, uncorrected for the table's other rows.

