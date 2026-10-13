PR #906, design round 3, at ToyOS 8fec83d (one empty commit). Redesigned under the trust model
the owner approved on 2026-10-13, as the orchestrator's brief records it. Each file is a
measurement or a vendor document's text; the documents are not committed, their hashes are.

amd-trace-main.rs, amd-trace-Cargo.toml
    A host program that loads the AMD bench's DSDT and SSDT1..16, as dumped from the bench
    (the orchestrator's dump, acquired under another OS: evidence, never an oracle), into
    toyos-aml at 8fec83d unchanged, and evaluates \_SB_.PCI0.LPC0.EC__._REG(3, 1) and then
    \_SB_.ACAD._PSR, printing every access. The host is a model, not the machine: memory
    reads answer one fill byte everywhere (no NVS dump exists: the dump's /dev/mem reads
    were refused), the embedded controller's reads answer 01, and the mailbox ALIB reaches
    through 00:00.0's 0xB8/0xBC (AGRB = 0xF8000000, the bench's ECAM) answers its response
    word 1 once a message is written and 0 once it is cleared. Built and run:
      CARGO_TARGET_DIR=<scratch>/target cargo build -q            EXIT=0
      amdtrace <dump> 00 01 > amd-trace-fill00-ec01.txt           EXIT=0
      amdtrace <dump> ff 01 > amd-trace-fillff-ec01.txt           EXIT=0
    (the ec=00 runs differ only in that read's answer.) Under both models every write
    _REG(3, 1) and _PSR make is: 00:00.0 offsets 0xB8 and 0xBC through ECAM, and port 0x80
    from _PSR; and, under the 0xFF fill alone, where NDPC's ODV0 is set and it sends
    ALIB(0x0C) twelve times, ports 0x72 and 0x73 and one byte at 0xFE70039C, which no BAR the bench's kernel
    recorded covers (pr-875 f7a9eb7 round3/amd-acpi_tables_loaded.log lines 179-206).
    No write reaches a function's header (00h-3Fh), another function, or 00:00.2 (the
    IOMMU, class 0806).

intel-631122-host-bridge.txt
    631122 rev 003: 00:00.0's register list (§3.1), MCHBAR at 48h (§3.1.14), PCIEXBAR at
    60h (§3.1.19), and in MCHBAR GFXVTBAR 5400h and VTDPVC0BAR 5410h ("BIOS programs this
    register after which the register cannot be altered", §3.4.2, §3.4.4) and INTRDIRCTL
    5418h, "the MSI redirection logic" (§3.4.5).

Earlier rounds' files stand: design/ (afb02d7) and design-r2/ (f7f1f8c).
