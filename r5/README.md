# PR #1131 r5: Linux's APST table on the T14

The table was read by osbench's Linux `nvme` group (`f68a81b8e`): Get Features
0Ch through `NVME_IOCTL_ADMIN_CMD`, with the layout of the published UAPI
header (`nvme_ioctl.h`). The output, masked, is `linux/t14-nvme.txt`:
`nvme.apst=on`, `0->4 after 100 ms, 1->4, 2->4, 3->4 after 100 ms`.

ToyOS's `nvme-apst` now uses Linux's two tiers (`f9d53720e`). Its test of
the BC501's descriptors yields this table.

Negative control (`mutation-shallowest.patch`): taking a tier's shallowest
state fails exactly that test (`mutation-shallowest.log`).
