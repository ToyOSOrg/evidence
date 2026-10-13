PR #906, design round 2, at ToyOS 8fec83d (one empty commit). Answers the design review
https://github.com/ToyOSOrg/ToyOS/pull/906#issuecomment-6140377328. Each file is read from the
vendor's own document; the documents are not committed, their hashes are.

intel-631121-host-dids.txt     Intel 631121-012 (11th Gen Core Datasheet Vol 1), fetched for this
                               round: Table 15-3, the host bridge DIDs, and the platforms 631122
                               (Vol 2a) covers. sha256 of the PDF as served is in the file.
intel-631120-pad-cfg-dw0.txt   Intel 631120-002 §27: PAD_CFG_DW0's byte 0 and interrupt routes,
                               PADCFGLOCKTX, and every PAD_CFG_DW0 row of communities 0, 1, 2, 4
                               and 5 (196 rows; community 3 has no summary).
intel-631122-mchbar-three.txt  Intel 631122 rev 003 §3.3.31, §3.3.50, §3.3.51: the three MCHBAR
                               registers the T14 writes and their lock bits, and the T14's writes
                               from the pr-875 host trace.
