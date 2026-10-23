# crypto-oracles r2: toyos-crypto 4dc75f542 beside ring 0.17.14, OpenSSL 3.5.5 and AWS-LC 5.11.0, on each bench's Linux

Times are medians (ToyOS shipped: the mean of two shipped runs). A ratio is the median over paired samples of ToyOS shipped over the library, from shipped-1; above 1 means ToyOS is slower. "Behind the fastest" is the largest of the three ratios, with that library's name. "Unasserted / fastest" divides the unasserted ToyOS median by the fastest library's median. The note column flags a row whose A/B spread exceeds 5% in any run, or whose two shipped runs differ by more than 5%. "-" means the library has no such operation through the API used. Hot rows come first: bulk ChaCha20-Poly1305, AES-GCM, SHA-256, then the TLS and SSH handshake primitives.

### T14 (i5-1135G7, Ubuntu 24.04, kernel 6.8): r2

| row | ToyOS shipped | ToyOS unasserted | ring | OpenSSL | AWS-LC | shipped / ring | / OpenSSL | / AWS-LC | behind the fastest (shipped) | unasserted / fastest | note |
|---|---|---|---|---|---|---|---|---|---|---|---|
| chacha20-poly1305/seal/65536 | 22.69 µs | 22.72 µs | 26.50 µs | 26.68 µs | 26.41 µs | 0.86 | 0.85 | 0.86 | 0.86 (AWS-LC) | 0.86 |  |
| chacha20-poly1305/open/65536 | 24.00 µs | 24.03 µs | 27.54 µs | 28.06 µs | 27.56 µs | 0.87 | 0.85 | 0.87 | 0.87 (ring) | 0.87 |  |
| chacha20-poly1305/seal/16384 | 5849 ns | 5858 ns | 6694 ns | 6958 ns | 6710 ns | 0.87 | 0.84 | 0.87 | 0.87 (ring) | 0.88 |  |
| chacha20-poly1305/open/16384 | 5918 ns | 5919 ns | 6739 ns | 7037 ns | 6748 ns | 0.88 | 0.84 | 0.88 | 0.88 (ring) | 0.88 |  |
| chacha20-poly1305/seal/1024 | 579 ns | 580 ns | 558 ns | 832 ns | 580 ns | 1.03 | 0.69 | 1.00 | 1.03 (ring) | 1.04 |  |
| chacha20-poly1305/open/1024 | 591 ns | 585 ns | 563 ns | 863 ns | 567 ns | 1.05 | 0.69 | 1.05 | 1.05 (ring) | 1.04 |  |
| aes-128-gcm/seal/16384 | 1753 ns | 1752 ns | 1620 ns | 1312 ns | 1243 ns | 1.08 | 1.34 | 1.41 | 1.41 (AWS-LC) | 1.41 |  |
| aes-128-gcm/open/16384 | 1774 ns | 1774 ns | 1690 ns | 1414 ns | 1296 ns | 1.05 | 1.25 | 1.37 | 1.37 (AWS-LC) | 1.37 |  |
| aes-256-gcm/seal/16384 | 1885 ns | 1884 ns | 1837 ns | 1522 ns | 1387 ns | 1.03 | 1.24 | 1.36 | 1.36 (AWS-LC) | 1.36 |  |
| aes-256-gcm/open/16384 | 2004 ns | 2005 ns | 1911 ns | 1594 ns | 1450 ns | 1.05 | 1.26 | 1.38 | 1.38 (AWS-LC) | 1.38 |  |
| aes-128-gcm/seal/65536 | 6716 ns | 6715 ns | 6405 ns | 4756 ns | 4603 ns | 1.05 | 1.41 | 1.46 | 1.46 (AWS-LC) | 1.46 |  |
| aes-256-gcm/seal/65536 | 7208 ns | 7195 ns | 7256 ns | 5477 ns | 5334 ns | 0.99 | 1.31 | 1.35 | 1.35 (AWS-LC) | 1.35 |  |
| aes-128-gcm/seal/1024 | 200 ns | 200 ns | 178 ns | 266 ns | 190 ns | 1.13 | 0.75 | 1.06 | 1.13 (ring) | 1.07 |  |
| aes-256-gcm/seal/1024 | 208 ns | 205 ns | 192 ns | 277 ns | 208 ns | 1.09 | 0.75 | 1.00 | 1.09 (ring) | 1.02 |  |
| sha-256/1048576 | 570.86 µs | 571.21 µs | 603.26 µs | 603.47 µs | 602.98 µs | 0.95 | 0.95 | 0.95 | 0.95 (AWS-LC) | 0.95 |  |
| sha-256/16384 | 8957 ns | 8935 ns | 9494 ns | 9539 ns | 9478 ns | 0.94 | 0.94 | 0.94 | 0.94 (AWS-LC) | 0.94 |  |
| sha-256/64 | 88 ns | 87 ns | 115 ns | 151 ns | 98 ns | 0.76 | 0.58 | 0.90 | 0.90 (AWS-LC) | 0.89 |  |
| x25519/ecdh | 52.56 µs | 52.30 µs | 38.89 µs | 62.16 µs | 38.70 µs | 1.35 | 0.85 | 1.36 | 1.36 (AWS-LC) | 1.35 |  |
| p-256/ecdh | 78.48 µs | 78.61 µs | 53.41 µs | 69.33 µs | 58.98 µs | 1.47 | 1.13 | 1.33 | 1.47 (ring) | 1.47 |  |
| ed25519/sign/64 | 16.32 µs | 16.29 µs | 12.62 µs | 32.83 µs | 7590 ns | 1.29 | 0.50 | 2.15 | 2.15 (AWS-LC) | 2.13 |  |
| ed25519/verify/64 | 50.27 µs | 48.08 µs | 46.30 µs | 98.01 µs | 31.63 µs | 1.09 | 0.51 | 1.59 | 1.59 (AWS-LC) | 1.52 |  |
| ecdsa-p-256-sha-256/verify/64 | 65.77 µs | 62.72 µs | 49.80 µs | 63.57 µs | 47.54 µs | 1.32 | 1.03 | 1.38 | 1.38 (AWS-LC) | 1.32 |  |
| rsa-2048-pkcs1-sha-256/verify/64 | 23.76 µs | 24.15 µs | 19.84 µs | 22.03 µs | 20.91 µs | 1.20 | 1.09 | 1.15 | 1.20 (ring) | 1.20 |  |
| rsa-2048-pss-sha-256/verify/64 | 24.69 µs | 24.91 µs | 23.87 µs | 22.57 µs | 21.95 µs | 1.04 | 1.10 | 1.14 | 1.14 (AWS-LC) | 1.13 |  |
| chacha20-poly1305-openssh/seal/32768 | 11.87 µs | 11.89 µs | 30.40 µs | 13.63 µs | 18.92 µs | 0.39 | 0.87 | 0.63 | 0.87 (OpenSSL) | 0.88 |  |
| chacha20-poly1305-openssh/open/32768 | 12.57 µs | 12.58 µs | 30.97 µs | 14.19 µs | 19.53 µs | 0.41 | 0.89 | 0.64 | 0.89 (OpenSSL) | 0.89 |  |
| chacha20-poly1305-openssh/seal/16384 | 6123 ns | 6131 ns | 15.33 µs | 7033 ns | 9637 ns | 0.40 | 0.87 | 0.64 | 0.87 (OpenSSL) | 0.88 |  |
| **other rows** | | | | | | | | | | | |
| aes-128-gcm/key | 177 ns | 177 ns | 232 ns | 334 ns | 174 ns | 0.76 | 0.53 | 1.01 | 1.01 (AWS-LC) | 1.01 |  |
| aes-128-gcm/seal/0 | 49 ns | 49 ns | 73 ns | 129 ns | 78 ns | 0.67 | 0.38 | 0.62 | 0.67 (ring) | 0.64 |  |
| aes-128-gcm/open/0 | 72 ns | 71 ns | 102 ns | 156 ns | 101 ns | 0.69 | 0.45 | 0.69 | 0.69 (AWS-LC) | 0.70 | spread>5% |
| aes-128-gcm/reject/0 | 51 ns | 52 ns | 76 ns | 144 ns | 83 ns | 0.67 | 0.35 | 0.61 | 0.67 (ring) | 0.65 |  |
| aes-128-gcm/seal/64 | 53 ns | 53 ns | 88 ns | 166 ns | 93 ns | 0.60 | 0.32 | 0.57 | 0.60 (ring) | 0.55 |  |
| aes-128-gcm/open/64 | 70 ns | 71 ns | 104 ns | 176 ns | 89 ns | 0.67 | 0.40 | 0.78 | 0.78 (AWS-LC) | 0.82 |  |
| aes-128-gcm/reject/64 | 55 ns | 55 ns | 92 ns | 186 ns | 103 ns | 0.59 | 0.29 | 0.53 | 0.59 (ring) | 0.54 |  |
| aes-128-gcm/open/1024 | 202 ns | 203 ns | 183 ns | 284 ns | 190 ns | 1.10 | 0.71 | 1.06 | 1.10 (ring) | 1.07 |  |
| aes-128-gcm/reject/1024 | 133 ns | 132 ns | 184 ns | 298 ns | 216 ns | 0.73 | 0.45 | 0.62 | 0.73 (ring) | 0.67 |  |
| aes-128-gcm/reject/16384 | 879 ns | 880 ns | 1652 ns | 1370 ns | 1378 ns | 0.53 | 0.64 | 0.64 | 0.64 (OpenSSL) | 0.65 |  |
| aes-128-gcm/open/65536 | 7992 ns | 7990 ns | 7592 ns | 6094 ns | 5940 ns | 1.05 | 1.31 | 1.34 | 1.34 (AWS-LC) | 1.34 |  |
| aes-128-gcm/reject/65536 | 3272 ns | 3276 ns | 6932 ns | 4772 ns | 6121 ns | 0.47 | 0.69 | 0.53 | 0.69 (OpenSSL) | 0.69 |  |
| aes-256-gcm/key | 192 ns | 191 ns | 241 ns | 341 ns | 180 ns | 0.79 | 0.56 | 1.06 | 1.06 (AWS-LC) | 1.06 |  |
| aes-256-gcm/seal/0 | 51 ns | 52 ns | 73 ns | 127 ns | 81 ns | 0.70 | 0.41 | 0.63 | 0.70 (ring) | 0.65 |  |
| aes-256-gcm/open/0 | 73 ns | 74 ns | 101 ns | 158 ns | 78 ns | 0.72 | 0.46 | 0.94 | 0.94 (AWS-LC) | 0.99 |  |
| aes-256-gcm/reject/0 | 55 ns | 55 ns | 77 ns | 145 ns | 86 ns | 0.71 | 0.38 | 0.64 | 0.71 (ring) | 0.67 |  |
| aes-256-gcm/seal/64 | 56 ns | 56 ns | 91 ns | 164 ns | 96 ns | 0.61 | 0.34 | 0.58 | 0.61 (ring) | 0.58 |  |
| aes-256-gcm/open/64 | 68 ns | 68 ns | 104 ns | 177 ns | 102 ns | 0.65 | 0.38 | 0.66 | 0.66 (AWS-LC) | 0.67 | spread>5% |
| aes-256-gcm/reject/64 | 58 ns | 58 ns | 91 ns | 188 ns | 107 ns | 0.63 | 0.31 | 0.54 | 0.63 (ring) | 0.55 |  |
| aes-256-gcm/open/1024 | 222 ns | 223 ns | 196 ns | 294 ns | 206 ns | 1.13 | 0.76 | 1.08 | 1.13 (ring) | 1.08 |  |
| aes-256-gcm/reject/1024 | 135 ns | 134 ns | 199 ns | 304 ns | 236 ns | 0.68 | 0.45 | 0.57 | 0.68 (ring) | 0.64 |  |
| aes-256-gcm/reject/16384 | 888 ns | 890 ns | 1874 ns | 1546 ns | 1524 ns | 0.47 | 0.57 | 0.58 | 0.58 (AWS-LC) | 0.58 |  |
| aes-256-gcm/open/65536 | 8843 ns | 8838 ns | 8642 ns | 6823 ns | 6698 ns | 1.02 | 1.30 | 1.32 | 1.32 (AWS-LC) | 1.32 |  |
| aes-256-gcm/reject/65536 | 3274 ns | 3279 ns | 7721 ns | 5524 ns | 6809 ns | 0.42 | 0.59 | 0.48 | 0.59 (OpenSSL) | 0.60 |  |
| chacha20-poly1305/key | 16 ns | 16 ns | 30 ns | 340 ns | 74 ns | 0.51 | 0.04 | 0.20 | 0.51 (ring) | 0.53 | drift 7% |
| chacha20-poly1305/seal/0 | 153 ns | 154 ns | 131 ns | 353 ns | 152 ns | 1.17 | 0.43 | 1.00 | 1.17 (ring) | 1.17 |  |
| chacha20-poly1305/open/0 | 179 ns | 175 ns | 160 ns | 390 ns | 156 ns | 1.11 | 0.46 | 1.14 | 1.14 (AWS-LC) | 1.12 |  |
| chacha20-poly1305/reject/0 | 148 ns | 147 ns | 135 ns | 386 ns | 141 ns | 1.10 | 0.38 | 1.05 | 1.10 (ring) | 1.09 |  |
| chacha20-poly1305/seal/64 | 167 ns | 170 ns | 152 ns | 465 ns | 172 ns | 1.11 | 0.36 | 0.97 | 1.11 (ring) | 1.12 |  |
| chacha20-poly1305/open/64 | 180 ns | 180 ns | 177 ns | 486 ns | 179 ns | 1.02 | 0.37 | 1.01 | 1.02 (ring) | 1.02 |  |
| chacha20-poly1305/reject/64 | 160 ns | 158 ns | 158 ns | 501 ns | 171 ns | 1.01 | 0.32 | 0.93 | 1.01 (ring) | 1.00 |  |
| chacha20-poly1305/reject/1024 | 341 ns | 340 ns | 564 ns | 872 ns | 581 ns | 0.60 | 0.39 | 0.59 | 0.60 (ring) | 0.61 |  |
| chacha20-poly1305/reject/16384 | 2195 ns | 2202 ns | 6725 ns | 6982 ns | 6813 ns | 0.33 | 0.31 | 0.32 | 0.33 (ring) | 0.33 |  |
| chacha20-poly1305/reject/65536 | 8083 ns | 8101 ns | 27.04 µs | 26.56 µs | 27.86 µs | 0.30 | 0.30 | 0.29 | 0.30 (OpenSSL) | 0.31 |  |
| chacha20-poly1305-openssh/key | 8 ns | 9 ns | 2 ns | - | 11 ns | 3.43 | - | 0.77 | 3.43 (ring) | 3.44 | drift 6% |
| chacha20-poly1305-openssh/length | 75 ns | 73 ns | 107 ns | 125 ns | 108 ns | 0.71 | 0.60 | 0.70 | 0.71 (ring) | 0.68 |  |
| chacha20-poly1305-openssh/seal/0 | 126 ns | 126 ns | 270 ns | 379 ns | 308 ns | 0.47 | 0.33 | 0.41 | 0.47 (ring) | 0.47 |  |
| chacha20-poly1305-openssh/open/0 | 234 ns | 234 ns | 310 ns | 421 ns | 351 ns | 0.76 | 0.56 | 0.67 | 0.76 (ring) | 0.76 |  |
| chacha20-poly1305-openssh/reject/0 | 202 ns | 204 ns | 279 ns | 350 ns | 317 ns | 0.72 | 0.58 | 0.64 | 0.72 (ring) | 0.73 |  |
| chacha20-poly1305-openssh/seal/64 | 154 ns | 152 ns | 407 ns | 486 ns | 452 ns | 0.38 | 0.32 | 0.34 | 0.38 (ring) | 0.37 |  |
| chacha20-poly1305-openssh/open/64 | 240 ns | 241 ns | 435 ns | 514 ns | 482 ns | 0.55 | 0.46 | 0.49 | 0.55 (ring) | 0.56 |  |
| chacha20-poly1305-openssh/reject/64 | 225 ns | 224 ns | 323 ns | 369 ns | 363 ns | 0.69 | 0.61 | 0.62 | 0.69 (ring) | 0.69 |  |
| chacha20-poly1305-openssh/seal/1024 | 701 ns | 704 ns | 1239 ns | 869 ns | 936 ns | 0.57 | 0.81 | 0.75 | 0.81 (OpenSSL) | 0.82 |  |
| chacha20-poly1305-openssh/open/1024 | 799 ns | 800 ns | 1259 ns | 890 ns | 953 ns | 0.64 | 0.90 | 0.84 | 0.90 (OpenSSL) | 0.91 |  |
| chacha20-poly1305-openssh/reject/1024 | 470 ns | 467 ns | 943 ns | 519 ns | 647 ns | 0.50 | 0.91 | 0.73 | 0.91 (OpenSSL) | 0.90 |  |
| chacha20-poly1305-openssh/open/16384 | 6291 ns | 6299 ns | 15.47 µs | 7128 ns | 9749 ns | 0.41 | 0.88 | 0.65 | 0.88 (OpenSSL) | 0.89 |  |
| chacha20-poly1305-openssh/reject/16384 | 2372 ns | 2388 ns | 10.76 µs | 2429 ns | 5094 ns | 0.22 | 0.98 | 0.47 | 0.98 (OpenSSL) | 1.00 |  |
| chacha20-poly1305-openssh/reject/32768 | 4437 ns | 4446 ns | 21.23 µs | 4454 ns | 9837 ns | 0.21 | 0.99 | 0.45 | 0.99 (OpenSSL) | 1.01 |  |
| sha-512/64 | 236 ns | 238 ns | 252 ns | 312 ns | 236 ns | 0.93 | 0.76 | 1.00 | 1.00 (AWS-LC) | 1.01 |  |
| sha-512/16384 | 25.66 µs | 25.60 µs | 25.67 µs | 21.83 µs | 25.37 µs | 1.00 | 1.18 | 1.01 | 1.18 (OpenSSL) | 1.17 |  |
| hmac-sha-256/64 | 235 ns | 235 ns | 318 ns | 395 ns | 500 ns | 0.74 | 0.59 | 0.47 | 0.74 (ring) | 0.76 |  |
| hmac-sha-384/64 | 874 ns | 869 ns | 960 ns | 1005 ns | 1120 ns | 0.91 | 0.87 | 0.78 | 0.91 (ring) | 0.91 |  |
| hkdf-sha-256/32 | 432 ns | 434 ns | 626 ns | 2342 ns | 867 ns | 0.69 | 0.18 | 0.50 | 0.69 (ring) | 0.68 |  |
| hkdf-sha-384/48 | 1785 ns | 1787 ns | 1938 ns | 3752 ns | 2194 ns | 0.92 | 0.48 | 0.81 | 0.92 (ring) | 0.92 |  |
| p-384/ecdh | 638.01 µs | 640.28 µs | 713.71 µs | 1471.65 µs | 186.88 µs | 0.89 | 0.43 | 3.42 | 3.42 (AWS-LC) | 3.42 |  |
| ecdsa-p-384-sha-384/verify/64 | 329.73 µs | 331.21 µs | 697.12 µs | 640.68 µs | 183.37 µs | 0.48 | 0.52 | 1.81 | 1.81 (AWS-LC) | 1.81 |  |
| rsa-4096-pkcs1-sha-256/verify/64 | 87.19 µs | 87.31 µs | 71.61 µs | 59.31 µs | 58.98 µs | 1.22 | 1.47 | 1.48 | 1.48 (AWS-LC) | 1.48 |  |
| rsa-4096-pss-sha-256/verify/64 | 88.77 µs | 88.82 µs | 73.74 µs | 62.32 µs | 61.23 µs | 1.21 | 1.43 | 1.45 | 1.45 (AWS-LC) | 1.46 |  |
| ml-kem-768/keygen | 96.23 µs | 96.47 µs | - | 44.28 µs | 24.54 µs | - | 2.18 | 3.93 | 3.93 (AWS-LC) | 3.93 |  |
| ml-kem-768/encapsulate | 113.71 µs | 114.38 µs | - | 30.90 µs | 25.22 µs | - | 3.68 | 4.51 | 4.51 (AWS-LC) | 4.53 |  |
| ml-kem-768/keygen+decapsulate | 246.60 µs | 248.93 µs | - | 91.13 µs | 40.76 µs | - | 2.71 | 6.05 | 6.05 (AWS-LC) | 6.10 |  |

### AMD bench (Ryzen 7 4800U, Ubuntu 24.04, kernel 6.8): r2

| row | ToyOS shipped | ToyOS unasserted | ring | OpenSSL | AWS-LC | shipped / ring | / OpenSSL | / AWS-LC | behind the fastest (shipped) | unasserted / fastest | note |
|---|---|---|---|---|---|---|---|---|---|---|---|
| chacha20-poly1305/seal/65536 | 25.51 µs | 25.39 µs | 22.23 µs | 28.65 µs | 22.13 µs | 1.14 | 0.89 | 1.15 | 1.15 (AWS-LC) | 1.14 |  |
| chacha20-poly1305/open/65536 | 31.13 µs | 31.25 µs | 22.99 µs | 29.80 µs | 23.54 µs | 1.34 | 1.04 | 1.31 | 1.34 (ring) | 1.35 |  |
| chacha20-poly1305/seal/16384 | 6673 ns | 6624 ns | 5665 ns | 7442 ns | 5689 ns | 1.17 | 0.89 | 1.17 | 1.17 (ring) | 1.16 |  |
| chacha20-poly1305/open/16384 | 7876 ns | 7908 ns | 5761 ns | 7624 ns | 5860 ns | 1.36 | 1.03 | 1.34 | 1.36 (ring) | 1.36 |  |
| chacha20-poly1305/seal/1024 | 759 ns | 755 ns | 509 ns | 801 ns | 539 ns | 1.48 | 0.94 | 1.40 | 1.48 (ring) | 1.47 |  |
| chacha20-poly1305/open/1024 | 747 ns | 745 ns | 519 ns | 828 ns | 534 ns | 1.43 | 0.90 | 1.40 | 1.43 (ring) | 1.41 |  |
| aes-128-gcm/seal/16384 | 3742 ns | 3743 ns | 3285 ns | 3407 ns | 3323 ns | 1.13 | 1.09 | 1.12 | 1.13 (ring) | 1.13 |  |
| aes-128-gcm/open/16384 | 3756 ns | 3752 ns | 3474 ns | 3589 ns | 3510 ns | 1.07 | 1.04 | 1.07 | 1.07 (ring) | 1.08 |  |
| aes-256-gcm/seal/16384 | 3740 ns | 3869 ns | 3624 ns | 3760 ns | 3667 ns | 1.03 | 0.99 | 1.01 | 1.03 (ring) | 1.06 |  |
| aes-256-gcm/open/16384 | 4791 ns | 4812 ns | 3796 ns | 3930 ns | 3848 ns | 1.25 | 1.21 | 1.24 | 1.25 (ring) | 1.26 |  |
| aes-128-gcm/seal/65536 | 14.65 µs | 14.73 µs | 12.85 µs | 12.96 µs | 12.86 µs | 1.13 | 1.12 | 1.13 | 1.13 (ring) | 1.14 |  |
| aes-256-gcm/seal/65536 | 14.62 µs | 15.12 µs | 14.20 µs | 14.33 µs | 14.25 µs | 1.02 | 1.01 | 1.02 | 1.02 (ring) | 1.06 |  |
| aes-128-gcm/seal/1024 | 329 ns | 330 ns | 288 ns | 412 ns | 319 ns | 1.14 | 0.80 | 1.03 | 1.14 (ring) | 1.14 |  |
| aes-256-gcm/seal/1024 | 340 ns | 351 ns | 310 ns | 437 ns | 345 ns | 1.09 | 0.77 | 0.98 | 1.09 (ring) | 1.13 |  |
| sha-256/1048576 | 496.60 µs | 495.90 µs | 495.62 µs | 496.23 µs | 495.66 µs | 1.00 | 1.00 | 1.00 | 1.00 (ring) | 1.00 |  |
| sha-256/16384 | 7794 ns | 7785 ns | 7814 ns | 7849 ns | 7792 ns | 0.99 | 0.99 | 1.00 | 1.00 (AWS-LC) | 1.00 |  |
| sha-256/64 | 80 ns | 80 ns | 114 ns | 162 ns | 92 ns | 0.70 | 0.49 | 0.86 | 0.86 (AWS-LC) | 0.86 |  |
| x25519/ecdh | 55.63 µs | 55.79 µs | 41.57 µs | 61.09 µs | 29.08 µs | 1.33 | 0.91 | 1.91 | 1.91 (AWS-LC) | 1.90 |  |
| p-256/ecdh | 70.28 µs | 70.38 µs | 50.52 µs | 68.75 µs | 50.31 µs | 1.39 | 1.01 | 1.39 | 1.39 (AWS-LC) | 1.39 |  |
| ed25519/sign/64 | 16.94 µs | 16.85 µs | 12.81 µs | 32.29 µs | 7586 ns | 1.32 | 0.52 | 2.22 | 2.22 (AWS-LC) | 2.21 |  |
| ed25519/verify/64 | 51.26 µs | 48.90 µs | 53.72 µs | 99.11 µs | 32.76 µs | 0.95 | 0.52 | 1.56 | 1.56 (AWS-LC) | 1.48 |  |
| ecdsa-p-256-sha-256/verify/64 | 59.59 µs | 58.12 µs | 46.94 µs | 61.81 µs | 46.33 µs | 1.27 | 0.97 | 1.29 | 1.29 (AWS-LC) | 1.24 |  |
| rsa-2048-pkcs1-sha-256/verify/64 | 26.85 µs | 26.81 µs | 18.88 µs | 25.37 µs | 24.06 µs | 1.38 | 1.06 | 1.12 | 1.38 (ring) | 1.41 |  |
| rsa-2048-pss-sha-256/verify/64 | 27.70 µs | 27.61 µs | 26.64 µs | 23.75 µs | 24.62 µs | 1.04 | 1.17 | 1.14 | 1.17 (OpenSSL) | 1.15 |  |
| chacha20-poly1305-openssh/seal/32768 | 15.24 µs | 15.33 µs | 30.99 µs | 14.57 µs | 20.10 µs | 0.49 | 1.04 | 0.75 | 1.04 (OpenSSL) | 1.05 |  |
| chacha20-poly1305-openssh/open/32768 | 16.96 µs | 17.03 µs | 32.57 µs | 16.18 µs | 21.76 µs | 0.52 | 1.04 | 0.78 | 1.04 (OpenSSL) | 1.04 |  |
| chacha20-poly1305-openssh/seal/16384 | 7790 ns | 7796 ns | 15.58 µs | 7502 ns | 10.26 µs | 0.50 | 1.03 | 0.76 | 1.03 (OpenSSL) | 1.03 |  |
| **other rows** | | | | | | | | | | | |
| aes-128-gcm/key | 201 ns | 201 ns | 267 ns | 368 ns | 212 ns | 0.75 | 0.55 | 0.94 | 0.94 (AWS-LC) | 0.95 |  |
| aes-128-gcm/seal/0 | 60 ns | 58 ns | 71 ns | 152 ns | 101 ns | 0.85 | 0.39 | 0.59 | 0.85 (ring) | 0.80 |  |
| aes-128-gcm/open/0 | 68 ns | 68 ns | 80 ns | 157 ns | 95 ns | 0.85 | 0.43 | 0.71 | 0.85 (ring) | 0.82 |  |
| aes-128-gcm/reject/0 | 64 ns | 64 ns | 80 ns | 194 ns | 99 ns | 0.79 | 0.33 | 0.64 | 0.79 (ring) | 0.78 |  |
| aes-128-gcm/seal/64 | 63 ns | 64 ns | 92 ns | 216 ns | 120 ns | 0.68 | 0.29 | 0.52 | 0.68 (ring) | 0.69 |  |
| aes-128-gcm/open/64 | 75 ns | 76 ns | 103 ns | 231 ns | 120 ns | 0.73 | 0.32 | 0.63 | 0.73 (ring) | 0.73 |  |
| aes-128-gcm/reject/64 | 69 ns | 70 ns | 109 ns | 268 ns | 153 ns | 0.64 | 0.26 | 0.46 | 0.64 (ring) | 0.65 |  |
| aes-128-gcm/open/1024 | 336 ns | 334 ns | 319 ns | 433 ns | 338 ns | 1.05 | 0.77 | 0.99 | 1.05 (ring) | 1.06 |  |
| aes-128-gcm/reject/1024 | 194 ns | 194 ns | 328 ns | 464 ns | 402 ns | 0.59 | 0.42 | 0.48 | 0.59 (ring) | 0.60 |  |
| aes-128-gcm/reject/16384 | 1820 ns | 1823 ns | 3419 ns | 3466 ns | 3611 ns | 0.53 | 0.52 | 0.50 | 0.53 (ring) | 0.53 |  |
| aes-128-gcm/open/65536 | 17.26 µs | 17.30 µs | 16.05 µs | 16.16 µs | 16.08 µs | 1.07 | 1.06 | 1.07 | 1.07 (ring) | 1.07 |  |
| aes-128-gcm/reject/65536 | 7011 ns | 7065 ns | 13.36 µs | 13.02 µs | 13.90 µs | 0.52 | 0.54 | 0.50 | 0.54 (OpenSSL) | 0.54 |  |
| aes-256-gcm/key | 208 ns | 208 ns | 273 ns | 367 ns | 218 ns | 0.76 | 0.56 | 0.95 | 0.95 (AWS-LC) | 0.95 |  |
| aes-256-gcm/seal/0 | 61 ns | 64 ns | 72 ns | 149 ns | 104 ns | 0.85 | 0.41 | 0.59 | 0.85 (ring) | 0.87 |  |
| aes-256-gcm/open/0 | 71 ns | 72 ns | 82 ns | 160 ns | 98 ns | 0.88 | 0.45 | 0.73 | 0.88 (ring) | 0.86 |  |
| aes-256-gcm/reject/0 | 67 ns | 67 ns | 80 ns | 192 ns | 102 ns | 0.83 | 0.35 | 0.66 | 0.83 (ring) | 0.84 |  |
| aes-256-gcm/seal/64 | 67 ns | 68 ns | 94 ns | 216 ns | 126 ns | 0.71 | 0.31 | 0.54 | 0.71 (ring) | 0.71 |  |
| aes-256-gcm/open/64 | 79 ns | 79 ns | 106 ns | 232 ns | 130 ns | 0.74 | 0.34 | 0.60 | 0.74 (ring) | 0.74 |  |
| aes-256-gcm/reject/64 | 72 ns | 72 ns | 111 ns | 270 ns | 154 ns | 0.66 | 0.27 | 0.47 | 0.66 (ring) | 0.65 |  |
| aes-256-gcm/open/1024 | 409 ns | 402 ns | 341 ns | 451 ns | 366 ns | 1.19 | 0.90 | 1.11 | 1.19 (ring) | 1.18 |  |
| aes-256-gcm/reject/1024 | 198 ns | 198 ns | 350 ns | 485 ns | 425 ns | 0.56 | 0.41 | 0.46 | 0.56 (ring) | 0.57 |  |
| aes-256-gcm/reject/16384 | 1828 ns | 1833 ns | 3758 ns | 3804 ns | 3949 ns | 0.48 | 0.48 | 0.46 | 0.48 (ring) | 0.49 |  |
| aes-256-gcm/open/65536 | 21.41 µs | 21.46 µs | 15.24 µs | 17.51 µs | 17.42 µs | 1.40 | 1.22 | 1.22 | 1.40 (ring) | 1.40 |  |
| aes-256-gcm/reject/65536 | 7027 ns | 7066 ns | 14.69 µs | 14.35 µs | 15.23 µs | 0.48 | 0.49 | 0.46 | 0.49 (OpenSSL) | 0.49 |  |
| chacha20-poly1305/key | 24 ns | 26 ns | 49 ns | 358 ns | 104 ns | 0.54 | 0.07 | 0.25 | 0.54 (ring) | 0.54 | drift 13% |
| chacha20-poly1305/seal/0 | 165 ns | 165 ns | 132 ns | 292 ns | 155 ns | 1.23 | 0.56 | 1.05 | 1.23 (ring) | 1.27 |  |
| chacha20-poly1305/open/0 | 166 ns | 165 ns | 138 ns | 310 ns | 144 ns | 1.20 | 0.54 | 1.15 | 1.20 (ring) | 1.18 |  |
| chacha20-poly1305/reject/0 | 162 ns | 159 ns | 136 ns | 334 ns | 151 ns | 1.18 | 0.48 | 1.07 | 1.18 (ring) | 1.16 |  |
| chacha20-poly1305/seal/64 | 184 ns | 195 ns | 147 ns | 410 ns | 172 ns | 1.24 | 0.45 | 1.07 | 1.24 (ring) | 1.33 |  |
| chacha20-poly1305/open/64 | 181 ns | 180 ns | 157 ns | 421 ns | 164 ns | 1.15 | 0.43 | 1.10 | 1.15 (ring) | 1.14 |  |
| chacha20-poly1305/reject/64 | 174 ns | 173 ns | 165 ns | 458 ns | 185 ns | 1.05 | 0.38 | 0.94 | 1.05 (ring) | 1.04 |  |
| chacha20-poly1305/reject/1024 | 377 ns | 372 ns | 529 ns | 855 ns | 602 ns | 0.71 | 0.44 | 0.62 | 0.71 (ring) | 0.70 |  |
| chacha20-poly1305/reject/16384 | 2491 ns | 2512 ns | 5720 ns | 7496 ns | 5982 ns | 0.43 | 0.33 | 0.41 | 0.43 (ring) | 0.44 |  |
| chacha20-poly1305/reject/65536 | 9242 ns | 9428 ns | 22.37 µs | 28.73 µs | 23.27 µs | 0.41 | 0.32 | 0.40 | 0.41 (ring) | 0.42 |  |
| chacha20-poly1305-openssh/key | 11 ns | 10 ns | 2 ns | - | 20 ns | 4.70 | - | 0.55 | 4.70 (ring) | 4.29 | drift 5% |
| chacha20-poly1305-openssh/length | 102 ns | 101 ns | 106 ns | 133 ns | 111 ns | 0.96 | 0.77 | 0.92 | 0.96 (ring) | 0.96 |  |
| chacha20-poly1305-openssh/seal/0 | 148 ns | 148 ns | 268 ns | 399 ns | 328 ns | 0.55 | 0.37 | 0.45 | 0.55 (ring) | 0.55 |  |
| chacha20-poly1305-openssh/open/0 | 256 ns | 262 ns | 284 ns | 414 ns | 344 ns | 0.90 | 0.62 | 0.74 | 0.90 (ring) | 0.91 |  |
| chacha20-poly1305-openssh/reject/0 | 246 ns | 252 ns | 277 ns | 368 ns | 338 ns | 0.89 | 0.67 | 0.73 | 0.89 (ring) | 0.90 |  |
| chacha20-poly1305-openssh/seal/64 | 183 ns | 183 ns | 396 ns | 503 ns | 478 ns | 0.46 | 0.36 | 0.38 | 0.46 (ring) | 0.46 |  |
| chacha20-poly1305-openssh/open/64 | 294 ns | 298 ns | 411 ns | 520 ns | 499 ns | 0.71 | 0.56 | 0.59 | 0.71 (ring) | 0.71 |  |
| chacha20-poly1305-openssh/reject/64 | 281 ns | 287 ns | 315 ns | 382 ns | 389 ns | 0.89 | 0.73 | 0.72 | 0.89 (ring) | 0.91 |  |
| chacha20-poly1305-openssh/seal/1024 | 846 ns | 840 ns | 1222 ns | 896 ns | 987 ns | 0.69 | 0.94 | 0.85 | 0.94 (OpenSSL) | 0.93 |  |
| chacha20-poly1305-openssh/open/1024 | 969 ns | 959 ns | 1246 ns | 925 ns | 1013 ns | 0.77 | 1.04 | 0.95 | 1.04 (OpenSSL) | 1.03 |  |
| chacha20-poly1305-openssh/reject/1024 | 501 ns | 494 ns | 942 ns | 550 ns | 698 ns | 0.53 | 0.91 | 0.71 | 0.91 (OpenSSL) | 0.89 |  |
| chacha20-poly1305-openssh/open/16384 | 8091 ns | 8134 ns | 15.81 µs | 7694 ns | 10.44 µs | 0.51 | 1.05 | 0.77 | 1.05 (OpenSSL) | 1.05 |  |
| chacha20-poly1305-openssh/reject/16384 | 2606 ns | 2622 ns | 11.01 µs | 2830 ns | 5649 ns | 0.24 | 0.92 | 0.46 | 0.92 (OpenSSL) | 0.92 |  |
| chacha20-poly1305-openssh/reject/32768 | 4849 ns | 4888 ns | 21.68 µs | 5270 ns | 10.91 µs | 0.22 | 0.92 | 0.44 | 0.92 (OpenSSL) | 0.92 |  |
| sha-512/64 | 264 ns | 267 ns | 258 ns | 300 ns | 240 ns | 1.02 | 0.88 | 1.10 | 1.10 (AWS-LC) | 1.13 |  |
| sha-512/16384 | 26.25 µs | 26.31 µs | 25.08 µs | 18.26 µs | 25.01 µs | 1.04 | 1.43 | 1.04 | 1.43 (OpenSSL) | 1.43 |  |
| hmac-sha-256/64 | 188 ns | 188 ns | 286 ns | 348 ns | 554 ns | 0.66 | 0.54 | 0.34 | 0.66 (ring) | 0.66 |  |
| hmac-sha-384/64 | 949 ns | 938 ns | 967 ns | 908 ns | 1260 ns | 0.97 | 1.04 | 0.75 | 1.04 (OpenSSL) | 1.02 |  |
| hkdf-sha-256/32 | 368 ns | 364 ns | 560 ns | 2582 ns | 780 ns | 0.65 | 0.14 | 0.47 | 0.65 (ring) | 0.65 |  |
| hkdf-sha-384/48 | 1943 ns | 1940 ns | 1952 ns | 3936 ns | 2246 ns | 0.99 | 0.49 | 0.86 | 0.99 (ring) | 0.99 |  |
| p-384/ecdh | 602.51 µs | 600.97 µs | 648.08 µs | 1446.89 µs | 172.50 µs | 0.93 | 0.41 | 3.48 | 3.48 (AWS-LC) | 3.47 |  |
| ecdsa-p-384-sha-384/verify/64 | 308.36 µs | 307.97 µs | 629.14 µs | 651.70 µs | 177.35 µs | 0.49 | 0.47 | 1.74 | 1.74 (AWS-LC) | 1.72 |  |
| rsa-4096-pkcs1-sha-256/verify/64 | 97.91 µs | 97.66 µs | 67.87 µs | 55.69 µs | 55.03 µs | 1.43 | 1.75 | 1.77 | 1.77 (AWS-LC) | 1.76 |  |
| rsa-4096-pss-sha-256/verify/64 | 99.50 µs | 99.17 µs | 69.50 µs | 58.29 µs | 56.42 µs | 1.43 | 1.70 | 1.75 | 1.75 (AWS-LC) | 1.75 |  |
| ml-kem-768/keygen | 94.04 µs | 93.46 µs | - | 38.12 µs | 15.83 µs | - | 2.45 | 5.91 | 5.91 (AWS-LC) | 5.88 |  |
| ml-kem-768/encapsulate | 112.27 µs | 110.36 µs | - | 25.77 µs | 16.69 µs | - | 4.33 | 6.68 | 6.68 (AWS-LC) | 6.59 |  |
| ml-kem-768/keygen+decapsulate | 240.50 µs | 238.72 µs | - | 75.63 µs | 35.27 µs | - | 3.17 | 6.78 | 6.78 (AWS-LC) | 6.74 |  |

