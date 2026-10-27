## 11th_Gen_Intel(R)_Core(TM)_i5-1135G7_@_2.40GHz

Runs: Linux 4, ToyOS 4. lan.peer_link: wireless driver=iwlwifi. internet.link: none.

| bench | unit | Linux p50s | Linux median | Linux range | ToyOS p50s | ToyOS median | ToyOS range | ToyOS/Linux | p | verdict |
|---|---|---|---|---|---|---|---|---|---|---|
| cpu.clock | MHz | 4186, 1196, 4186, 4186 | 4186 | 71.4% | 3787, 3788, 3787, 3788 | 3788 | 0.0% | 0.90 | 0.229 | too few runs to resolve (least p 0.057) |
| lan.wifi.tcp.connect |  |  | - | - |  | - | - | - | - | Linux 4 run(s) unmeasured: this_run_reached_its_peer_over_its_wired_link; ToyOS 4 run(s) unsupported: ToyOS_has_no_Wi-Fi_driver:_issues/there-is-no-wifi.md |
| lan.wifi.tcp.download |  |  | - | - |  | - | - | - | - | Linux 4 run(s) unmeasured: this_run_reached_its_peer_over_its_wired_link; ToyOS 4 run(s) unsupported: ToyOS_has_no_Wi-Fi_driver:_issues/there-is-no-wifi.md |
| lan.wifi.tcp.rtt.64 |  |  | - | - |  | - | - | - | - | Linux 4 run(s) unmeasured: this_run_reached_its_peer_over_its_wired_link; ToyOS 4 run(s) unsupported: ToyOS_has_no_Wi-Fi_driver:_issues/there-is-no-wifi.md |
| lan.wifi.tcp.upload |  |  | - | - |  | - | - | - | - | Linux 4 run(s) unmeasured: this_run_reached_its_peer_over_its_wired_link; ToyOS 4 run(s) unsupported: ToyOS_has_no_Wi-Fi_driver:_issues/there-is-no-wifi.md |
| lan.wired.tcp.connect | ns | 1407864, 1959684, 1961011, 1927036 | 1943360 | 28.5% | 2998473, 3010446, 2984214, 3012703 | 3004460 | 0.9% | 1.55 | 0.029 | ToyOS worse |
| lan.wired.tcp.download | MB/s | 110, 114, 111, 112 | 112 | 3.6% | 114, 113, 113, 113 | 113 | 0.9% | 1.01 | 0.229 | too few runs to resolve (least p 0.086) |
| lan.wired.tcp.rtt.64 | ns | 2002900, 2003459, 2004339, 2026137 | 2003899 | 1.2% | 1999250, 1997114, 1978300, 1960413 | 1987707 | 2.0% | 0.99 | 0.029 | ToyOS better |
| lan.wired.tcp.upload | MB/s | 111, 111, 112, 111 | 111 | 0.9% | 36, 32, 31, 33 | 32 | 15.4% | 0.29 | 0.029 | ToyOS worse |

Each p is its row's alone, uncorrected for the table's other rows.

