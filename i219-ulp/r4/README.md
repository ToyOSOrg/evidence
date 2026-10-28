# PR #1091: T14 boot at 2fb6b8c60

The orchestrator ran the boot and judged the row PASS. judge-i219-lines.txt holds the row's two printed lines and the verdict, taken from its judge.log. linux-wol-before.txt is the bench Linux's Wake-on-LAN setting before the boot.

Register values:

- **Wake, as found.** ULP configuration 0x1800 (bits 11 and 12), power control 0x9084 (bit 14 clear, K1 off), 0xE4 0x80000000. Read after ToyOS's LANPHYPC cycle and its forcing of SMBus.
- **Bring-up, after the disarm and RST|PHY_RST.** ULP configuration 0x0000, power control 0x9084, 0xE4 0x80000000.
- **LANPHYPC hold.** 10091 ns.
- **IND (bit 2).** Clear in both readings.
