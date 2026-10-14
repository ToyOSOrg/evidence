PR #921, AMD-Vi stage 6 (interrupt remapping), head b85bbb0ca.
Spec: AMD 48882 rev 3.11, SHA-256 f7c375a15db5ed63de760356867211063d164a2ed59f2d38613daec95894ce22
(the owner's download from AMD; PR #909's d2/spec records the same bytes from docs.amd.com).
logs/s3-intremap-on.log: QEMU 11.1.1 amd-iommu with intremap=on,xtsup=on (a temporary harness edit, not committed): its IVRS names the I/O APIC (special variety=1 handle=0 as 00:14.0), EFR 0x29d7.
