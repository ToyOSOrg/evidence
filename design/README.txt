PR #906, design round, at ToyOS 8fec83d (origin/main 1a81b5926 + one empty commit).
What the design rests on, each read from the vendor's own document:

ppr55922-searches.txt      AMD PPR 55922-A1 rev 3.06 (Family 17h Model 60h): every term
                           searched for the root complex's index at 0xB8/0xBC and the SMN
                           it reaches, with its count, the namespace list and Table 13.
                           Text from 55922-A1-PUB_3.06.pdf (294 pages); a second extraction
                           by pdftext/ (lopdf) also reads 294 pages and no "SMN".
intel-631119-table109.txt  Intel 631119-007 (500 Series On-Package PCH Vol 1) §35 Table 109,
                           the sideband Target Port IDs, and §2 Table 6, the eSPI DIDs.
intel-631120-p2sb.txt      Intel 631120-002 (Vol 2) §3.1.5 SBREG_BAR (bits 31:24, 16 MiB) and
                           §3.1.22 P2SBC, HIDE.
intel-631122-os-access.txt Intel 631122 rev 003 (11th Gen Core Datasheet Vol 2a): every
                           register's BIOS/SMM/OS Access column, made by
                             pdftext/ 631122.pdf 631122.txt   (lopdf decrypts the PDF)
                             python3 -I os_access.py 631122.txt
                           946 registers.
The benches' PCI enumeration (P2SB 00:1f.1 absent on the T14; 00:00.0 1022:1630, 00:00.2
1022:1631 and 00:18.0-7 on the AMD bench) is pr-875 f7a9eb737bc6a1157ea9f148056c95e4b4d3e75b,
round3/t14-testcases.log lines 162-182 and round3/amd-acpi_tables_loaded.log lines 179-196.
