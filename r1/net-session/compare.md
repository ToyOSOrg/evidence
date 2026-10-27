## 11th_Gen_Intel(R)_Core(TM)_i5-1135G7_@_2.40GHz

Runs: Linux 4, ToyOS 4. lan.peer_link: wireless driver=iwlwifi. internet.link: wired.

| bench | unit | Linux p50s | Linux median | Linux range | ToyOS p50s | ToyOS median | ToyOS range | ToyOS/Linux | p | verdict |
|---|---|---|---|---|---|---|---|---|---|---|
| cpu.clock@internet | MHz | 4185, 4189, 4192, 4176 | 4187 | 0.4% | 3190, 1782, 1595, 1649 | 1716 | 93.0% | 0.41 | 0.029 | ToyOS lower |
| cpu.clock@lan | MHz | 4186, 4186, 4186, 4186 | 4186 | 0.0% | 3787, 3787, 3787, 3588 | 3787 | 5.3% | 0.90 | 0.029 | ToyOS lower |
| internet.https.download |  |  | - | - |  | - | - | - | - | Linux 4 run(s) refused: GET:_http_status:_429; ToyOS 4 run(s) refused: GET:_http_status:_429 |
| internet.https.rtt | ns | 8026851, 9000450, 8163975, 9123448 | 8582212 | 12.8% | 7352347, 7913901, 7484022, 8391746 | 7698962 | 13.5% | 0.90 | 0.114 | not resolved |
| internet.https.upload | ns | 166617312, 282770941, 131907970, 122724346 | 149262641 | 107.2% | 352160342, 189070928, 181801266, 236566056 | 212818492 | 80.0% | 1.43 | 0.200 | not resolved |
| internet.tcp.connect | ns | 5991225, 5968847, 6074204, 5968568 | 5980036 | 1.8% | 6853297, 6984365, 7008010, 7011434 | 6996188 | 2.3% | 1.17 | 0.029 | ToyOS worse |
| lan.wifi.tcp.connect |  |  | - | - |  | - | - | - | - | Linux 4 run(s) unmeasured: this_run_reached_its_peer_over_its_wired_link; ToyOS 4 run(s) unsupported: ToyOS_has_no_Wi-Fi_driver:_issues/there-is-no-wifi.md |
| lan.wifi.tcp.download |  |  | - | - |  | - | - | - | - | Linux 4 run(s) unmeasured: this_run_reached_its_peer_over_its_wired_link; ToyOS 4 run(s) unsupported: ToyOS_has_no_Wi-Fi_driver:_issues/there-is-no-wifi.md |
| lan.wifi.tcp.rtt.64 |  |  | - | - |  | - | - | - | - | Linux 4 run(s) unmeasured: this_run_reached_its_peer_over_its_wired_link; ToyOS 4 run(s) unsupported: ToyOS_has_no_Wi-Fi_driver:_issues/there-is-no-wifi.md |
| lan.wifi.tcp.upload |  |  | - | - |  | - | - | - | - | Linux 4 run(s) unmeasured: this_run_reached_its_peer_over_its_wired_link; ToyOS 4 run(s) unsupported: ToyOS_has_no_Wi-Fi_driver:_issues/there-is-no-wifi.md |
| lan.wired.tcp.connect | ns | 1278720, 1241310, 2007368, 1974848 | 1626784 | 47.1% | 2054094, 3022838, 3058894, 2997493 | 3010166 | 33.4% | 1.85 | 0.029 | ToyOS worse |
| lan.wired.tcp.download | MB/s | 109, 111, 108, 107 | 108 | 3.7% | 110, 110, 110, 110 | 110 | 0.0% | 1.01 | 0.314 | too few runs to resolve (least p 0.114) |
| lan.wired.tcp.rtt.64 | ns | 2079002, 2046934, 2102134, 2099649 | 2089326 | 2.6% | 1996955, 1998734, 1999453, 1999717 | 1999094 | 0.1% | 0.96 | 0.029 | ToyOS better |
| lan.wired.tcp.upload | MB/s | 113, 110, 111, 112 | 112 | 2.7% | 62, 63, 65, 64 | 64 | 4.7% | 0.57 | 0.029 | ToyOS worse |

Each p is its row's alone, uncorrected for the table's other rows.

## AMD_Ryzen_7_4800U_with_Radeon_Graphics

Runs: Linux 4, ToyOS 0. lan.peer_link: wired driver=e1000e. internet.link: wireless.

| bench | unit | Linux p50s | Linux median | Linux range | ToyOS p50s | ToyOS median | ToyOS range | ToyOS/Linux | p | verdict |
|---|---|---|---|---|---|---|---|---|---|---|
| cpu.clock@internet | MHz | 1361, 1368, 4033, 1362 | 1365 | 195.8% |  | - | - | - | - |  |
| cpu.clock@lan | MHz | 1362, 1361, 1362, 1361 | 1362 | 0.1% |  | - | - | - | - |  |
| internet.https.download |  |  | - | - |  | - | - | - | - | Linux 4 run(s) refused: GET:_http_status:_429 |
| internet.https.rtt | ns | 9060166, 9055974, 9970351, 9919714 | 9489940 | 9.6% |  | - | - | - | - |  |
| internet.https.upload | ns | 307087245, 189788253, 361067134, 118763485 | 248437749 | 97.5% |  | - | - | - | - |  |
| internet.tcp.connect | ns | 7293432, 7032570, 7315362, 7835058 | 7304397 | 11.0% |  | - | - | - | - |  |
| lan.wifi.tcp.connect | ns | 2021379, 1992325, 2020680, 1995677 | 2008178 | 1.4% |  | - | - | - | - |  |
| lan.wifi.tcp.download | MB/s | 112, 111, 113, 109 | 112 | 3.6% |  | - | - | - | - |  |
| lan.wifi.tcp.rtt.64 | ns | 2003988, 2012369, 2005314, 2006712 | 2006013 | 0.4% |  | - | - | - | - |  |
| lan.wifi.tcp.upload | MB/s | 106, 103, 109, 108 | 107 | 5.6% |  | - | - | - | - |  |
| lan.wired.tcp.connect |  |  | - | - |  | - | - | - | - | Linux 4 run(s) unmeasured: this_run_reached_its_peer_over_its_wifi_link |
| lan.wired.tcp.download |  |  | - | - |  | - | - | - | - | Linux 4 run(s) unmeasured: this_run_reached_its_peer_over_its_wifi_link |
| lan.wired.tcp.rtt.64 |  |  | - | - |  | - | - | - | - | Linux 4 run(s) unmeasured: this_run_reached_its_peer_over_its_wifi_link |
| lan.wired.tcp.upload |  |  | - | - |  | - | - | - | - | Linux 4 run(s) unmeasured: this_run_reached_its_peer_over_its_wifi_link |

Each p is its row's alone, uncorrected for the table's other rows.

