### t14 r1

| row | ToyOS shipped | ToyOS unasserted | ring | OpenSSL | AWS-LC | shipped / ring | / OpenSSL | / AWS-LC | unasserted / fastest | note |
|---|---|---|---|---|---|---|---|---|---|---|
| chacha20-poly1305/seal/65536 | 235.76 µs | 23.03 µs | 26.50 µs | 26.71 µs | 26.42 µs | 8.75 | 8.69 | 8.78 | 0.87 | shipped: r1 build artefact |
| chacha20-poly1305/open/65536 | 237.08 µs | 24.36 µs | 27.55 µs | 28.00 µs | 27.54 µs | 8.47 | 8.33 | 8.47 | 0.88 | shipped: r1 build artefact |
| chacha20-poly1305/seal/16384 | 59.13 µs | 5937 ns | 6694 ns | 6960 ns | 6710 ns | 8.69 | 8.36 | 8.67 | 0.89 | shipped: r1 build artefact |
| chacha20-poly1305/open/16384 | 59.22 µs | 5999 ns | 6749 ns | 7039 ns | 6746 ns | 8.63 | 8.28 | 8.64 | 0.89 | shipped: r1 build artefact |
| chacha20-poly1305/seal/1024 | 3913 ns | 582 ns | 558 ns | 825 ns | 579 ns | 6.90 | 4.67 | 6.66 | 1.04 | shipped: r1 build artefact |
| chacha20-poly1305/open/1024 | 3921 ns | 586 ns | 564 ns | 855 ns | 567 ns | 6.85 | 4.51 | 6.82 | 1.04 | shipped: r1 build artefact |
| aes-128-gcm/seal/16384 | 1749 ns | 1749 ns | 1620 ns | 1307 ns | 1246 ns | 1.08 | 1.34 | 1.40 | 1.41 |  |
| aes-128-gcm/open/16384 | 1773 ns | 1771 ns | 1693 ns | 1407 ns | 1299 ns | 1.05 | 1.26 | 1.36 | 1.36 |  |
| aes-256-gcm/seal/16384 | 1881 ns | 1881 ns | 1839 ns | 1536 ns | 1391 ns | 1.02 | 1.22 | 1.35 | 1.35 |  |
| aes-256-gcm/open/16384 | 2004 ns | 2002 ns | 1911 ns | 1593 ns | 1453 ns | 1.05 | 1.26 | 1.38 | 1.38 |  |
| aes-128-gcm/seal/65536 | 6706 ns | 6706 ns | 6405 ns | 4754 ns | 4612 ns | 1.05 | 1.41 | 1.45 | 1.46 |  |
| aes-256-gcm/seal/65536 | 7201 ns | 7208 ns | 7254 ns | 5481 ns | 5333 ns | 0.99 | 1.31 | 1.35 | 1.35 |  |
| aes-128-gcm/seal/1024 | 198 ns | 198 ns | 178 ns | 266 ns | 189 ns | 1.12 | 0.75 | 1.05 | 1.09 |  |
| aes-256-gcm/seal/1024 | 206 ns | 204 ns | 191 ns | 278 ns | 208 ns | 1.07 | 0.74 | 0.99 | 1.05 |  |
| sha-256/1048576 | 568.44 µs | 568.45 µs | 602.99 µs | 603.23 µs | 602.95 µs | 0.94 | 0.94 | 0.94 | 0.94 |  |
| sha-256/16384 | 8939 ns | 8939 ns | 9491 ns | 9541 ns | 9478 ns | 0.94 | 0.94 | 0.94 | 0.94 |  |
| sha-256/64 | 88 ns | 91 ns | 109 ns | 152 ns | 98 ns | 0.80 | 0.58 | 0.89 | 0.94 |  |
| x25519/ecdh | 52.98 µs | 52.54 µs | 38.86 µs | 62.11 µs | 38.71 µs | 1.36 | 0.85 | 1.37 | 1.36 |  |
| p-256/ecdh | 78.63 µs | 78.61 µs | 53.37 µs | 69.31 µs | 59.03 µs | 1.47 | 1.13 | 1.33 | 1.47 |  |
| ed25519/sign/64 | 16.30 µs | 16.42 µs | 12.66 µs | 32.84 µs | 7665 ns | 1.29 | 0.50 | 2.12 | 2.16 |  |
| ed25519/verify/64 | 50.47 µs | 48.09 µs | 46.36 µs | 98.04 µs | 31.63 µs | 1.09 | 0.52 | 1.59 | 1.52 |  |
| ecdsa-p-256-sha-256/verify/64 | 64.71 µs | 63.12 µs | 49.83 µs | 63.42 µs | 47.52 µs | 1.30 | 1.01 | 1.36 | 1.33 |  |
| rsa-2048-pkcs1-sha-256/verify/64 | 23.80 µs | 23.78 µs | 19.86 µs | 22.05 µs | 20.80 µs | 1.20 | 1.08 | 1.15 | 1.20 |  |
| rsa-2048-pss-sha-256/verify/64 | 24.76 µs | 24.63 µs | 23.89 µs | 22.49 µs | 21.83 µs | 1.04 | 1.10 | 1.14 | 1.12 |  |
| chacha20-poly1305-openssh/seal/32768 | 120.60 µs | 12.08 µs | 30.57 µs | 13.59 µs | 18.90 µs | 3.88 | 8.73 | 6.28 | 0.89 | shipped: r1 build artefact |
| chacha20-poly1305-openssh/open/32768 | 121.35 µs | 12.78 µs | 31.00 µs | 14.13 µs | 19.49 µs | 3.85 | 8.45 | 6.13 | 0.90 | shipped: r1 build artefact |
| **other rows** | | | | | | | | | | |
| aes-128-gcm/key | 176 ns | 176 ns | 234 ns | 335 ns | 173 ns | 0.76 | 0.53 | 1.02 | 1.01 |  |
| aes-128-gcm/seal/0 | 48 ns | 48 ns | 73 ns | 132 ns | 77 ns | 0.66 | 0.37 | 0.63 | 0.67 |  |
| aes-128-gcm/open/0 | 69 ns | 69 ns | 102 ns | 162 ns | 105 ns | 0.68 | 0.43 | 0.66 | 0.68 |  |
| aes-128-gcm/reject/0 | 51 ns | 51 ns | 77 ns | 144 ns | 79 ns | 0.66 | 0.35 | 0.64 | 0.66 |  |
| aes-128-gcm/seal/64 | 53 ns | 53 ns | 88 ns | 164 ns | 93 ns | 0.60 | 0.32 | 0.57 | 0.58 |  |
| aes-128-gcm/open/64 | 73 ns | 73 ns | 107 ns | 177 ns | 91 ns | 0.69 | 0.41 | 0.80 | 0.80 |  |
| aes-128-gcm/reject/64 | 55 ns | 55 ns | 91 ns | 184 ns | 102 ns | 0.60 | 0.30 | 0.53 | 0.60 |  |
| aes-128-gcm/open/1024 | 202 ns | 200 ns | 184 ns | 286 ns | 202 ns | 1.10 | 0.71 | 1.00 | 1.09 |  |
| aes-128-gcm/reject/1024 | 129 ns | 130 ns | 186 ns | 292 ns | 220 ns | 0.70 | 0.44 | 0.59 | 0.70 |  |
| aes-128-gcm/reject/16384 | 878 ns | 877 ns | 1652 ns | 1360 ns | 1382 ns | 0.53 | 0.65 | 0.64 | 0.65 |  |
| aes-128-gcm/open/65536 | 7994 ns | 7991 ns | 7592 ns | 6096 ns | 5959 ns | 1.05 | 1.31 | 1.34 | 1.34 |  |
| aes-128-gcm/reject/65536 | 3276 ns | 3271 ns | 6933 ns | 4768 ns | 6125 ns | 0.47 | 0.69 | 0.53 | 0.69 |  |
| aes-256-gcm/key | 190 ns | 191 ns | 240 ns | 341 ns | 178 ns | 0.79 | 0.56 | 1.07 | 1.07 |  |
| aes-256-gcm/seal/0 | 52 ns | 52 ns | 73 ns | 128 ns | 80 ns | 0.70 | 0.41 | 0.64 | 0.71 |  |
| aes-256-gcm/open/0 | 73 ns | 73 ns | 102 ns | 159 ns | 74 ns | 0.71 | 0.46 | 0.99 | 0.96 |  |
| aes-256-gcm/reject/0 | 54 ns | 54 ns | 77 ns | 144 ns | 82 ns | 0.70 | 0.38 | 0.66 | 0.71 |  |
| aes-256-gcm/seal/64 | 56 ns | 56 ns | 93 ns | 164 ns | 97 ns | 0.60 | 0.34 | 0.58 | 0.58 |  |
| aes-256-gcm/open/64 | 69 ns | 69 ns | 105 ns | 175 ns | 103 ns | 0.65 | 0.39 | 0.67 | 0.67 | spread>5% |
| aes-256-gcm/reject/64 | 57 ns | 58 ns | 92 ns | 187 ns | 105 ns | 0.62 | 0.31 | 0.55 | 0.63 |  |
| aes-256-gcm/open/1024 | 221 ns | 220 ns | 197 ns | 292 ns | 207 ns | 1.13 | 0.76 | 1.07 | 1.12 |  |
| aes-256-gcm/reject/1024 | 133 ns | 133 ns | 200 ns | 304 ns | 238 ns | 0.67 | 0.44 | 0.56 | 0.67 |  |
| aes-256-gcm/reject/16384 | 887 ns | 888 ns | 1875 ns | 1552 ns | 1524 ns | 0.47 | 0.57 | 0.58 | 0.58 |  |
| aes-256-gcm/open/65536 | 8850 ns | 8833 ns | 8644 ns | 6827 ns | 6689 ns | 1.02 | 1.30 | 1.32 | 1.32 |  |
| aes-256-gcm/reject/65536 | 3279 ns | 3278 ns | 7723 ns | 5512 ns | 6810 ns | 0.42 | 0.59 | 0.48 | 0.60 |  |
| chacha20-poly1305/key | 15 ns | 18 ns | 30 ns | 340 ns | 74 ns | 0.50 | 0.04 | 0.20 | 0.61 |  |
| chacha20-poly1305/seal/0 | 154 ns | 149 ns | 131 ns | 355 ns | 151 ns | 1.17 | 0.43 | 1.02 | 1.14 |  |
| chacha20-poly1305/open/0 | 179 ns | 174 ns | 161 ns | 392 ns | 159 ns | 1.11 | 0.46 | 1.13 | 1.10 |  |
| chacha20-poly1305/reject/0 | 149 ns | 147 ns | 135 ns | 386 ns | 142 ns | 1.11 | 0.39 | 1.05 | 1.09 |  |
| chacha20-poly1305/seal/64 | 167 ns | 167 ns | 151 ns | 460 ns | 172 ns | 1.10 | 0.36 | 0.97 | 1.10 |  |
| chacha20-poly1305/open/64 | 180 ns | 179 ns | 177 ns | 484 ns | 179 ns | 1.02 | 0.37 | 1.01 | 1.01 |  |
| chacha20-poly1305/reject/64 | 159 ns | 158 ns | 158 ns | 496 ns | 170 ns | 1.01 | 0.32 | 0.93 | 1.00 |  |
| chacha20-poly1305/reject/1024 | 3674 ns | 344 ns | 560 ns | 863 ns | 584 ns | 6.45 | 4.19 | 6.19 | 0.61 | shipped: r1 build artefact |
| chacha20-poly1305/reject/16384 | 55.46 µs | 2285 ns | 6725 ns | 6979 ns | 6818 ns | 8.11 | 7.81 | 8.00 | 0.34 | shipped: r1 build artefact |
| chacha20-poly1305/reject/65536 | 221.05 µs | 8425 ns | 27.08 µs | 26.57 µs | 27.84 µs | 8.02 | 8.17 | 7.80 | 0.32 | shipped: r1 build artefact |
| chacha20-poly1305-openssh/key | 3 ns | 2 ns | 1 ns | - | 10 ns | 2.04 | - | 0.27 | 1.92 | drift 7% |
| chacha20-poly1305-openssh/length | 73 ns | 71 ns | 107 ns | 125 ns | 108 ns | 0.68 | 0.58 | 0.67 | 0.66 |  |
| chacha20-poly1305-openssh/seal/0 | 126 ns | 126 ns | 269 ns | 390 ns | 309 ns | 0.47 | 0.32 | 0.41 | 0.47 |  |
| chacha20-poly1305-openssh/open/0 | 234 ns | 232 ns | 310 ns | 424 ns | 350 ns | 0.75 | 0.55 | 0.67 | 0.75 |  |
| chacha20-poly1305-openssh/reject/0 | 202 ns | 201 ns | 279 ns | 353 ns | 316 ns | 0.73 | 0.57 | 0.64 | 0.72 |  |
| chacha20-poly1305-openssh/seal/64 | 153 ns | 152 ns | 407 ns | 495 ns | 455 ns | 0.38 | 0.31 | 0.34 | 0.37 |  |
| chacha20-poly1305-openssh/open/64 | 238 ns | 237 ns | 434 ns | 519 ns | 485 ns | 0.55 | 0.46 | 0.49 | 0.55 |  |
| chacha20-poly1305-openssh/reject/64 | 224 ns | 223 ns | 324 ns | 375 ns | 366 ns | 0.69 | 0.60 | 0.61 | 0.69 |  |
| chacha20-poly1305-openssh/seal/1024 | 3693 ns | 704 ns | 1242 ns | 873 ns | 937 ns | 2.93 | 4.17 | 3.88 | 0.81 | shipped: r1 build artefact |
| chacha20-poly1305-openssh/open/1024 | 3794 ns | 802 ns | 1260 ns | 888 ns | 955 ns | 2.97 | 4.19 | 3.92 | 0.90 | shipped: r1 build artefact |
| chacha20-poly1305-openssh/reject/1024 | 3463 ns | 472 ns | 963 ns | 522 ns | 643 ns | 3.54 | 6.52 | 5.30 | 0.91 | shipped: r1 build artefact |
| chacha20-poly1305-openssh/seal/16384 | 60.25 µs | 6216 ns | 15.38 µs | 7003 ns | 9630 ns | 3.85 | 8.47 | 6.16 | 0.89 | shipped: r1 build artefact |
| chacha20-poly1305-openssh/open/16384 | 60.44 µs | 6382 ns | 15.48 µs | 7096 ns | 9745 ns | 3.84 | 8.38 | 6.10 | 0.90 | shipped: r1 build artefact |
| chacha20-poly1305-openssh/reject/16384 | 56.54 µs | 2457 ns | 10.82 µs | 2422 ns | 5054 ns | 5.14 | 22.93 | 10.99 | 1.02 | shipped: r1 build artefact |
| chacha20-poly1305-openssh/reject/32768 | 113.24 µs | 4619 ns | 21.36 µs | 4458 ns | 9755 ns | 5.21 | 24.93 | 11.40 | 1.04 | shipped: r1 build artefact |
| sha-512/64 | 231 ns | 239 ns | 244 ns | 309 ns | 235 ns | 0.95 | 0.75 | 0.98 | 1.01 |  |
| sha-512/16384 | 24.98 µs | 25.00 µs | 25.66 µs | 21.83 µs | 25.37 µs | 0.97 | 1.15 | 0.98 | 1.15 |  |
| hmac-sha-256/64 | 235 ns | 238 ns | 314 ns | 421 ns | 518 ns | 0.75 | 0.56 | 0.45 | 0.77 |  |
| hmac-sha-384/64 | 850 ns | 874 ns | 958 ns | 1041 ns | 1144 ns | 0.89 | 0.81 | 0.74 | 0.91 |  |
| hkdf-sha-256/32 | 431 ns | 438 ns | 630 ns | 2390 ns | 834 ns | 0.68 | 0.18 | 0.52 | 0.70 |  |
| hkdf-sha-384/48 | 1745 ns | 1796 ns | 1944 ns | 3790 ns | 2175 ns | 0.90 | 0.46 | 0.80 | 0.92 |  |
| p-384/ecdh | 639.49 µs | 632.49 µs | 712.29 µs | 1474.60 µs | 186.77 µs | 0.90 | 0.43 | 3.42 | 3.38 |  |
| ecdsa-p-384-sha-384/verify/64 | 335.57 µs | 333.26 µs | 695.52 µs | 644.65 µs | 184.65 µs | 0.48 | 0.52 | 1.82 | 1.81 |  |
| rsa-4096-pkcs1-sha-256/verify/64 | 87.25 µs | 87.28 µs | 71.49 µs | 59.33 µs | 58.89 µs | 1.22 | 1.47 | 1.48 | 1.48 |  |
| rsa-4096-pss-sha-256/verify/64 | 88.86 µs | 88.80 µs | 73.73 µs | 62.35 µs | 61.20 µs | 1.21 | 1.43 | 1.45 | 1.45 |  |
| ml-kem-768/keygen | 95.98 µs | 95.61 µs | - | 44.18 µs | 24.51 µs | - | 2.17 | 3.92 | 3.89 |  |
| ml-kem-768/encapsulate | 116.07 µs | 114.24 µs | - | 30.86 µs | 25.22 µs | - | 3.76 | 4.60 | 4.53 |  |
| ml-kem-768/keygen+decapsulate | 248.99 µs | 248.31 µs | - | 91.07 µs | 40.75 µs | - | 2.73 | 6.12 | 6.07 |  |

### amd r1

| row | ToyOS shipped | ToyOS unasserted | ring | OpenSSL | AWS-LC | shipped / ring | / OpenSSL | / AWS-LC | unasserted / fastest | note |
|---|---|---|---|---|---|---|---|---|---|---|
| chacha20-poly1305/seal/65536 | 27.74 µs | 25.56 µs | 22.42 µs | 28.95 µs | 22.36 µs | 1.24 | 0.96 | 1.24 | 1.14 | shipped: r1 build artefact |
| chacha20-poly1305/open/65536 | 305.73 µs | 31.78 µs | 23.15 µs | 29.96 µs | 23.60 µs | 13.18 | 10.19 | 12.94 | 1.37 | shipped: r1 build artefact |
| chacha20-poly1305/seal/16384 | 8018 ns | 6662 ns | 5699 ns | 7525 ns | 5739 ns | 1.41 | 1.06 | 1.39 | 1.16 | shipped: r1 build artefact |
| chacha20-poly1305/open/16384 | 76.13 µs | 8001 ns | 5812 ns | 7684 ns | 5898 ns | 13.07 | 9.88 | 12.87 | 1.37 | shipped: r1 build artefact |
| chacha20-poly1305/seal/1024 | 1842 ns | 759 ns | 516 ns | 808 ns | 550 ns | 3.56 | 2.27 | 3.34 | 1.46 | shipped: r1 build artefact |
| chacha20-poly1305/open/1024 | 4993 ns | 760 ns | 530 ns | 839 ns | 543 ns | 9.40 | 5.94 | 9.18 | 1.46 | shipped: r1 build artefact |
| aes-128-gcm/seal/16384 | 3810 ns | 3722 ns | 3313 ns | 3438 ns | 3375 ns | 1.15 | 1.11 | 1.13 | 1.12 |  |
| aes-128-gcm/open/16384 | 3783 ns | 3774 ns | 3498 ns | 3626 ns | 3525 ns | 1.08 | 1.04 | 1.07 | 1.08 |  |
| aes-256-gcm/seal/16384 | 4028 ns | 3997 ns | 3646 ns | 3784 ns | 3689 ns | 1.10 | 1.06 | 1.09 | 1.09 |  |
| aes-256-gcm/open/16384 | 4828 ns | 4830 ns | 3832 ns | 3961 ns | 3866 ns | 1.25 | 1.22 | 1.25 | 1.26 |  |
| aes-128-gcm/seal/65536 | 14.96 µs | 14.65 µs | 13.01 µs | 13.09 µs | 13.00 µs | 1.15 | 1.14 | 1.15 | 1.12 |  |
| aes-256-gcm/seal/65536 | 15.80 µs | 15.70 µs | 14.34 µs | 14.47 µs | 14.37 µs | 1.10 | 1.09 | 1.10 | 1.09 |  |
| aes-128-gcm/seal/1024 | 329 ns | 327 ns | 291 ns | 409 ns | 322 ns | 1.13 | 0.80 | 1.02 | 1.13 |  |
| aes-256-gcm/seal/1024 | 348 ns | 345 ns | 314 ns | 443 ns | 347 ns | 1.11 | 0.79 | 1.00 | 1.10 |  |
| sha-256/1048576 | 497.61 µs | 498.25 µs | 497.38 µs | 497.59 µs | 496.41 µs | 1.00 | 1.00 | 1.00 | 1.00 |  |
| sha-256/16384 | 7816 ns | 7823 ns | 7825 ns | 7878 ns | 7804 ns | 1.00 | 0.99 | 1.00 | 1.00 |  |
| sha-256/64 | 80 ns | 84 ns | 105 ns | 162 ns | 93 ns | 0.77 | 0.50 | 0.86 | 0.89 |  |
| x25519/ecdh | 55.08 µs | 55.87 µs | 41.92 µs | 61.46 µs | 29.27 µs | 1.31 | 0.90 | 1.88 | 1.90 |  |
| p-256/ecdh | 70.47 µs | 70.66 µs | 50.89 µs | 69.16 µs | 50.80 µs | 1.38 | 1.02 | 1.39 | 1.39 |  |
| ed25519/sign/64 | 16.98 µs | 17.25 µs | 12.97 µs | 32.61 µs | 7632 ns | 1.31 | 0.52 | 2.22 | 2.25 |  |
| ed25519/verify/64 | 52.36 µs | 49.15 µs | 54.14 µs | 99.57 µs | 33.06 µs | 0.96 | 0.52 | 1.58 | 1.48 |  |
| ecdsa-p-256-sha-256/verify/64 | 60.08 µs | 57.78 µs | 47.52 µs | 62.21 µs | 47.20 µs | 1.27 | 0.97 | 1.27 | 1.24 |  |
| rsa-2048-pkcs1-sha-256/verify/64 | 27.13 µs | 27.01 µs | 19.05 µs | 25.48 µs | 24.30 µs | 1.41 | 1.08 | 1.12 | 1.42 |  |
| rsa-2048-pss-sha-256/verify/64 | 27.87 µs | 27.83 µs | 26.60 µs | 23.83 µs | 24.85 µs | 1.05 | 1.17 | 1.14 | 1.16 |  |
| chacha20-poly1305-openssh/seal/32768 | 150.30 µs | 15.51 µs | 31.12 µs | 14.64 µs | 20.21 µs | 4.82 | 10.25 | 7.42 | 1.05 | shipped: r1 build artefact |
| chacha20-poly1305-openssh/open/32768 | 152.05 µs | 17.24 µs | 32.76 µs | 16.31 µs | 21.89 µs | 4.63 | 9.31 | 6.93 | 1.05 | shipped: r1 build artefact |
| **other rows** | | | | | | | | | | |
| aes-128-gcm/key | 202 ns | 201 ns | 268 ns | 363 ns | 206 ns | 0.75 | 0.55 | 0.98 | 0.97 |  |
| aes-128-gcm/seal/0 | 57 ns | 58 ns | 72 ns | 153 ns | 99 ns | 0.80 | 0.37 | 0.58 | 0.78 |  |
| aes-128-gcm/open/0 | 66 ns | 65 ns | 80 ns | 158 ns | 94 ns | 0.81 | 0.41 | 0.69 | 0.79 |  |
| aes-128-gcm/reject/0 | 62 ns | 62 ns | 80 ns | 196 ns | 97 ns | 0.77 | 0.32 | 0.64 | 0.77 |  |
| aes-128-gcm/seal/64 | 61 ns | 62 ns | 92 ns | 217 ns | 121 ns | 0.66 | 0.28 | 0.51 | 0.68 |  |
| aes-128-gcm/open/64 | 72 ns | 73 ns | 103 ns | 226 ns | 120 ns | 0.70 | 0.32 | 0.60 | 0.70 |  |
| aes-128-gcm/reject/64 | 67 ns | 67 ns | 110 ns | 267 ns | 138 ns | 0.61 | 0.25 | 0.48 | 0.62 |  |
| aes-128-gcm/open/1024 | 334 ns | 334 ns | 315 ns | 441 ns | 335 ns | 1.06 | 0.76 | 0.99 | 1.05 |  |
| aes-128-gcm/reject/1024 | 190 ns | 192 ns | 327 ns | 462 ns | 400 ns | 0.58 | 0.41 | 0.47 | 0.59 |  |
| aes-128-gcm/reject/16384 | 1827 ns | 1830 ns | 3451 ns | 3498 ns | 3629 ns | 0.53 | 0.52 | 0.50 | 0.53 |  |
| aes-128-gcm/open/65536 | 17.36 µs | 17.38 µs | 16.23 µs | 16.33 µs | 16.22 µs | 1.07 | 1.06 | 1.07 | 1.07 |  |
| aes-128-gcm/reject/65536 | 7070 ns | 7071 ns | 13.52 µs | 13.16 µs | 14.03 µs | 0.52 | 0.54 | 0.50 | 0.54 |  |
| aes-256-gcm/key | 208 ns | 207 ns | 273 ns | 370 ns | 214 ns | 0.76 | 0.56 | 0.96 | 0.98 |  |
| aes-256-gcm/seal/0 | 61 ns | 62 ns | 72 ns | 152 ns | 102 ns | 0.85 | 0.40 | 0.60 | 0.83 |  |
| aes-256-gcm/open/0 | 69 ns | 70 ns | 82 ns | 161 ns | 98 ns | 0.84 | 0.43 | 0.70 | 0.84 |  |
| aes-256-gcm/reject/0 | 66 ns | 67 ns | 79 ns | 195 ns | 101 ns | 0.83 | 0.34 | 0.65 | 0.84 |  |
| aes-256-gcm/seal/64 | 65 ns | 66 ns | 96 ns | 221 ns | 127 ns | 0.68 | 0.29 | 0.51 | 0.69 |  |
| aes-256-gcm/open/64 | 76 ns | 75 ns | 107 ns | 232 ns | 127 ns | 0.71 | 0.33 | 0.60 | 0.70 |  |
| aes-256-gcm/reject/64 | 70 ns | 70 ns | 112 ns | 266 ns | 143 ns | 0.63 | 0.26 | 0.49 | 0.63 |  |
| aes-256-gcm/open/1024 | 404 ns | 409 ns | 339 ns | 460 ns | 362 ns | 1.19 | 0.88 | 1.11 | 1.19 |  |
| aes-256-gcm/reject/1024 | 195 ns | 197 ns | 352 ns | 485 ns | 422 ns | 0.55 | 0.40 | 0.46 | 0.56 |  |
| aes-256-gcm/reject/16384 | 1830 ns | 1838 ns | 3781 ns | 3819 ns | 3950 ns | 0.48 | 0.48 | 0.46 | 0.49 |  |
| aes-256-gcm/open/65536 | 21.55 µs | 21.55 µs | 15.38 µs | 17.68 µs | 17.56 µs | 1.40 | 1.22 | 1.22 | 1.39 |  |
| aes-256-gcm/reject/65536 | 7088 ns | 7088 ns | 14.79 µs | 14.44 µs | 15.32 µs | 0.48 | 0.49 | 0.46 | 0.49 |  |
| chacha20-poly1305/key | 21 ns | 25 ns | 49 ns | 360 ns | 105 ns | 0.44 | 0.06 | 0.20 | 0.50 |  |
| chacha20-poly1305/seal/0 | 168 ns | 164 ns | 131 ns | 294 ns | 155 ns | 1.28 | 0.57 | 1.08 | 1.24 |  |
| chacha20-poly1305/open/0 | 171 ns | 164 ns | 138 ns | 313 ns | 144 ns | 1.23 | 0.55 | 1.18 | 1.19 |  |
| chacha20-poly1305/reject/0 | 165 ns | 160 ns | 137 ns | 345 ns | 152 ns | 1.20 | 0.48 | 1.09 | 1.17 |  |
| chacha20-poly1305/seal/64 | 186 ns | 183 ns | 147 ns | 418 ns | 171 ns | 1.26 | 0.44 | 1.09 | 1.22 |  |
| chacha20-poly1305/open/64 | 184 ns | 180 ns | 159 ns | 432 ns | 162 ns | 1.16 | 0.42 | 1.13 | 1.13 |  |
| chacha20-poly1305/reject/64 | 177 ns | 173 ns | 165 ns | 465 ns | 186 ns | 1.07 | 0.38 | 0.95 | 1.04 |  |
| chacha20-poly1305/reject/1024 | 4620 ns | 378 ns | 542 ns | 856 ns | 611 ns | 8.52 | 5.39 | 7.54 | 0.71 | shipped: r1 build artefact |
| chacha20-poly1305/reject/16384 | 70.65 µs | 2594 ns | 5769 ns | 7532 ns | 6021 ns | 12.21 | 9.35 | 11.69 | 0.45 | shipped: r1 build artefact |
| chacha20-poly1305/reject/65536 | 281.67 µs | 9653 ns | 22.53 µs | 28.91 µs | 23.39 µs | 12.47 | 9.72 | 12.02 | 0.43 | shipped: r1 build artefact |
| chacha20-poly1305-openssh/key | 3 ns | 3 ns | 1 ns | - | 20 ns | 2.17 | - | 0.16 | 2.21 |  |
| chacha20-poly1305-openssh/length | 103 ns | 102 ns | 106 ns | 133 ns | 112 ns | 0.97 | 0.77 | 0.92 | 0.96 |  |
| chacha20-poly1305-openssh/seal/0 | 149 ns | 149 ns | 268 ns | 410 ns | 331 ns | 0.56 | 0.36 | 0.45 | 0.55 |  |
| chacha20-poly1305-openssh/open/0 | 257 ns | 256 ns | 287 ns | 427 ns | 351 ns | 0.89 | 0.60 | 0.73 | 0.89 |  |
| chacha20-poly1305-openssh/reject/0 | 249 ns | 246 ns | 280 ns | 378 ns | 342 ns | 0.88 | 0.66 | 0.72 | 0.88 |  |
| chacha20-poly1305-openssh/seal/64 | 184 ns | 184 ns | 400 ns | 515 ns | 491 ns | 0.46 | 0.35 | 0.37 | 0.46 |  |
| chacha20-poly1305-openssh/open/64 | 295 ns | 293 ns | 417 ns | 538 ns | 509 ns | 0.71 | 0.55 | 0.58 | 0.69 |  |
| chacha20-poly1305-openssh/reject/64 | 282 ns | 280 ns | 319 ns | 395 ns | 397 ns | 0.88 | 0.71 | 0.71 | 0.88 |  |
| chacha20-poly1305-openssh/seal/1024 | 4557 ns | 850 ns | 1228 ns | 908 ns | 1003 ns | 3.70 | 5.01 | 4.53 | 0.94 | shipped: r1 build artefact |
| chacha20-poly1305-openssh/open/1024 | 4689 ns | 973 ns | 1261 ns | 942 ns | 1029 ns | 3.71 | 4.96 | 4.54 | 1.04 | shipped: r1 build artefact |
| chacha20-poly1305-openssh/reject/1024 | 4201 ns | 505 ns | 948 ns | 556 ns | 706 ns | 4.43 | 7.55 | 5.95 | 0.91 | shipped: r1 build artefact |
| chacha20-poly1305-openssh/seal/16384 | 75.04 µs | 7905 ns | 15.67 µs | 7555 ns | 10.28 µs | 4.78 | 9.91 | 7.29 | 1.04 | shipped: r1 build artefact |
| chacha20-poly1305-openssh/open/16384 | 75.44 µs | 8217 ns | 15.88 µs | 7730 ns | 10.50 µs | 4.75 | 9.74 | 7.17 | 1.06 | shipped: r1 build artefact |
| chacha20-poly1305-openssh/reject/16384 | 69.84 µs | 2706 ns | 11.04 µs | 2849 ns | 5677 ns | 6.30 | 24.44 | 12.27 | 0.94 | shipped: r1 build artefact |
| chacha20-poly1305-openssh/reject/32768 | 139.88 µs | 5039 ns | 21.80 µs | 5297 ns | 10.95 µs | 6.40 | 26.33 | 12.73 | 0.95 | shipped: r1 build artefact |
| sha-512/64 | 266 ns | 274 ns | 252 ns | 301 ns | 234 ns | 1.05 | 0.89 | 1.13 | 1.14 |  |
| sha-512/16384 | 26.12 µs | 26.12 µs | 25.24 µs | 18.40 µs | 25.25 µs | 1.03 | 1.42 | 1.03 | 1.42 |  |
| hmac-sha-256/64 | 188 ns | 195 ns | 282 ns | 348 ns | 559 ns | 0.67 | 0.54 | 0.34 | 0.69 |  |
| hmac-sha-384/64 | 957 ns | 972 ns | 963 ns | 917 ns | 1276 ns | 0.99 | 1.04 | 0.75 | 1.06 |  |
| hkdf-sha-256/32 | 366 ns | 390 ns | 564 ns | 2622 ns | 790 ns | 0.65 | 0.14 | 0.46 | 0.69 |  |
| hkdf-sha-384/48 | 1947 ns | 1991 ns | 1970 ns | 3968 ns | 2266 ns | 0.99 | 0.49 | 0.86 | 1.01 |  |
| p-384/ecdh | 603.73 µs | 597.77 µs | 654.28 µs | 1462.28 µs | 173.90 µs | 0.92 | 0.41 | 3.47 | 3.45 |  |
| ecdsa-p-384-sha-384/verify/64 | 312.24 µs | 308.16 µs | 634.87 µs | 654.99 µs | 180.61 µs | 0.49 | 0.47 | 1.72 | 1.71 |  |
| rsa-4096-pkcs1-sha-256/verify/64 | 98.66 µs | 98.34 µs | 68.56 µs | 56.44 µs | 55.72 µs | 1.44 | 1.74 | 1.77 | 1.76 |  |
| rsa-4096-pss-sha-256/verify/64 | 100.04 µs | 99.68 µs | 70.17 µs | 58.91 µs | 57.07 µs | 1.42 | 1.70 | 1.75 | 1.75 |  |
| ml-kem-768/keygen | 94.42 µs | 93.12 µs | - | 38.32 µs | 15.96 µs | - | 2.46 | 5.89 | 5.82 |  |
| ml-kem-768/encapsulate | 113.14 µs | 110.03 µs | - | 25.97 µs | 16.83 µs | - | 4.35 | 6.71 | 6.53 |  |
| ml-kem-768/keygen+decapsulate | 242.15 µs | 237.03 µs | - | 76.41 µs | 35.59 µs | - | 3.16 | 6.79 | 6.65 |  |

