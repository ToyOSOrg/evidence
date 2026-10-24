## 11th_Gen_Intel(R)_Core(TM)_i5-1135G7_@_2.40GHz

Runs: Linux 4, ToyOS 3. lan.peer_link: wireless driver=iwlwifi. internet.link: wired.

| bench | unit | Linux p50s | Linux median | Linux range | ToyOS p50s | ToyOS median | ToyOS range | ToyOS/Linux | p | verdict |
|---|---|---|---|---|---|---|---|---|---|---|
| cpu.clock@internet | MHz | 3790, 4186, 3788, 4186 | 3988 | 10.0% | 3189, 1595, 2990 | 2990 | 53.3% | 0.75 | 0.057 | too few runs to resolve (least p 0.057) |
| cpu.clock@lan | MHz | 4186, 4184, 4185, 4186 | 4186 | 0.0% | 2791, 2791, 1495 | 2791 | 46.4% | 0.67 | 0.057 | too few runs to resolve (least p 0.057) |
| internet.https.download | ns |  | - | - | 257446685, 243662157, 240932724 | 243662157 | 6.8% | - | - | Linux 4 run(s) refused: GET:_http_status:_429 |
| internet.https.rtt | ns | 9322531, 8140755, 8111761, 8963924 | 8552340 | 14.2% | 7577961, 8006167, 7375014 | 7577961 | 8.3% | 0.89 | 0.057 | too few runs to resolve (least p 0.057) |
| internet.https.upload | ns | 125055997, 128821434, 126098676, 142129235 | 127460055 | 13.4% | 172872555, 208006567, 177858222 | 177858222 | 19.8% | 1.40 | 0.057 | too few runs to resolve (least p 0.057) |
| internet.tcp.connect | ns | 6093494, 6111866, 6054995, 6083731 | 6088612 | 0.9% | 6994817, 7025723, 7007946 | 7007946 | 0.4% | 1.15 | 0.057 | too few runs to resolve (least p 0.057) |
| lan.wifi.tcp.connect |  |  | - | - |  | - | - | - | - | Linux 4 run(s) unmeasured: this_run_reached_its_peer_over_its_wired_link; ToyOS 3 run(s) unsupported: ToyOS_has_no_Wi-Fi_driver:_issues/there-is-no-wifi.md |
| lan.wifi.tcp.download |  |  | - | - |  | - | - | - | - | Linux 4 run(s) unmeasured: this_run_reached_its_peer_over_its_wired_link; ToyOS 3 run(s) unsupported: ToyOS_has_no_Wi-Fi_driver:_issues/there-is-no-wifi.md |
| lan.wifi.tcp.rtt.64 |  |  | - | - |  | - | - | - | - | Linux 4 run(s) unmeasured: this_run_reached_its_peer_over_its_wired_link; ToyOS 3 run(s) unsupported: ToyOS_has_no_Wi-Fi_driver:_issues/there-is-no-wifi.md |
| lan.wifi.tcp.upload |  |  | - | - |  | - | - | - | - | Linux 4 run(s) unmeasured: this_run_reached_its_peer_over_its_wired_link; ToyOS 3 run(s) unsupported: ToyOS_has_no_Wi-Fi_driver:_issues/there-is-no-wifi.md |
| lan.wired.tcp.connect | ns | 1956670, 1794594, 1102152, 1134948 | 1464771 | 58.3% | 2194319, 2986220, 2060337 | 2194319 | 42.2% | 1.50 | 0.057 | too few runs to resolve (least p 0.057) |
| lan.wired.tcp.download | MB/s | 112, 110, 109, 112 | 111 | 2.7% | 112, 112, 109 | 112 | 2.7% | 1.01 | 1.000 | not resolved |
| lan.wired.tcp.rtt.64 | ns | 2019636, 2013566, 2018640, 2009565 | 2016103 | 0.5% | 1984468, 1988618, 1994398 | 1988618 | 0.5% | 0.99 | 0.057 | too few runs to resolve (least p 0.057) |
| lan.wired.tcp.upload | MB/s | 113, 113, 114, 113 | 113 | 0.9% | 41, 48, 31 | 41 | 41.5% | 0.36 | 0.029 | ToyOS worse |

Each p is its row's alone, uncorrected for the table's other rows.

## AMD_Ryzen_7_4800U_with_Radeon_Graphics

Runs: Linux 4, ToyOS 0. lan.peer_link: wired driver=e1000e. internet.link: wireless.

| bench | unit | Linux p50s | Linux median | Linux range | ToyOS p50s | ToyOS median | ToyOS range | ToyOS/Linux | p | verdict |
|---|---|---|---|---|---|---|---|---|---|---|
| cpu.clock@internet | MHz | 1362, 1362, 1362, 1361 | 1362 | 0.1% |  | - | - | - | - |  |
| cpu.clock@lan | MHz | 4033, 1649, 1362, 1363 | 1506 | 177.4% |  | - | - | - | - |  |
| internet.https.download |  |  | - | - |  | - | - | - | - | Linux 4 run(s) refused: GET:_http_status:_429 |
| internet.https.rtt | ns | 16215952, 10026889, 10987987, 11231386 | 11109686 | 55.7% |  | - | - | - | - |  |
| internet.https.upload | ns | 126668318, 151021227, 199788717, 187082611 | 169051919 | 43.3% |  | - | - | - | - |  |
| internet.tcp.connect | ns | 10043442, 7366392, 9988685, 9107347 | 9548016 | 28.0% |  | - | - | - | - |  |
| lan.wifi.tcp.connect | ns | 1996648, 2005029, 1999930, 8022559 | 2002480 | 300.9% |  | - | - | - | - |  |
| lan.wifi.tcp.download | MB/s | 114, 113, 114, 113 | 114 | 0.9% |  | - | - | - | - |  |
| lan.wifi.tcp.rtt.64 | ns | 2003702, 2003772, 2002724, 2000559 | 2003213 | 0.2% |  | - | - | - | - |  |
| lan.wifi.tcp.upload | MB/s | 109, 99, 112, 113 | 110 | 12.7% |  | - | - | - | - |  |
| lan.wired.tcp.connect |  |  | - | - |  | - | - | - | - | Linux 4 run(s) unmeasured: this_run_reached_its_peer_over_its_wifi_link |
| lan.wired.tcp.download |  |  | - | - |  | - | - | - | - | Linux 4 run(s) unmeasured: this_run_reached_its_peer_over_its_wifi_link |
| lan.wired.tcp.rtt.64 |  |  | - | - |  | - | - | - | - | Linux 4 run(s) unmeasured: this_run_reached_its_peer_over_its_wifi_link |
| lan.wired.tcp.upload |  |  | - | - |  | - | - | - | - | Linux 4 run(s) unmeasured: this_run_reached_its_peer_over_its_wifi_link |

Each p is its row's alone, uncorrected for the table's other rows.

