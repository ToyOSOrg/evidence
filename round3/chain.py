# Print each term of the AMD bench's tables the refused write runs through, as
# its offset in the dumped table and its bytes, for the decoding beside it.
import sys, os
d = sys.argv[1]
terms = [
    ("SSDT1", 0x24, 19, "Scope (\\_SB) { Name (AGRB, 0xF8000000) ...  -- 10 Scope, 5C5F53425F \\_SB_, 08 Name AGRB, 0C DWord F8000000"),
    ("SSDT1", 0x56C, 8, "Method (ALIB, 2)  -- 14 Method, AMD's entry its callers name"),
    ("SSDT1", 0x147B, 14, "OperationRegion (A120, SystemMemory, AGRB, 0x1000)  -- 5B80, space 00 SystemMemory, offset AGRB, length 0B 1000"),
    ("SSDT1", 0x1489, 16, "Field (A120, DWordAcc, Lock, Preserve) { Offset (0xB8), A121, 32 }  -- 5B81, flags 13 (DWordAcc, Lock, Preserve), 00 40 5C a reserved 0x5C0 bits (0xB8 bytes), A121 of 0x20 bits"),
    ("SSDT1", 0x1499, 25, "BankField (A120, A121, 0x03B10528, DWordAcc, Lock, Preserve) { Offset (0xBC), A118, 32 }"),
    ("SSDT1", 0x14B2, 25, "BankField (A120, A121, 0x03B10564, DWordAcc, Lock, Preserve) { Offset (0xBC), A111, 32 }"),
    ("SSDT1", 0x14CB, 25, "BankField (A120, A121, 0x03B10998, DWordAcc, Lock, Preserve) { Offset (0xBC), A112, 32 }"),
    ("SSDT1", 0x1A03, 52, "Method (A011, 2) { CreateDWordField (Arg1, 0, A105) ... (A105 to A110) ..."),
    ("SSDT1", 0x1A3B, 42, "A111 = 0; While (A111 != 0) {}; A112 = A105 ... A117 = A110; A118 = Arg0; While (A111 == 0) {}  -- a mailbox: the response cleared, six arguments, the message, the response awaited. A111 = 0 is its first access to the bank fields, and A111's bank value 0x03B10564 goes to A121 first (ACPI 6.5 §19.6.7)"),
    ("DSDT", 0x39B0, 46, "Method (_REG, 2) { If ((Arg0 == 3) && (Arg1 == 1)) { OKEC = Arg1; BASC = One; Notify (BAT1, Zero); ^VPC0.NDPC () } }  -- the only _REG of the 17 blocks"),
    ("DSDT", 0xA0D0, 12, "Method (NDPC) { CreateWordField (XX11, 0, SSZE) ... -- head of 1536 bytes; the tail below"),
    ("DSDT", 0x4FDB, 160, "Method (_PSR) { If (^^PCI0.LPC0.ECOK) { Local0 = ^^PCI0.LPC0.EC__.XYAC } Else { Local0 = 0 } ... If (Local0 != ACDC) { ... ALIB (One, XX00) ... } }"),
]
for table, at, n, what in terms:
    b = open(os.path.join(d, table), "rb").read()
    print(f"{table} +{at:#06x}: {b[at:at+n].hex(' ')}")
    print(f"    {what}")
b = open(os.path.join(d, "DSDT"), "rb").read()
start = 0xA0D0
body = b[start:start + 1540]
for needle, what in [(b"\x5b\x23ECMT\xe8\x03", "Acquire (ECMT, 1000)"), (b"\xa0\x4e\x0cODV0", "If (ODV0) {"), (b"ALIB\x0a\x0cXX11", "ALIB (0x0C, XX11)")]:
    i = body.find(needle)
    while i >= 0:
        print(f"DSDT +{start + i:#06x}: {body[i:i+len(needle)].hex(' ')}    {what}  (inside NDPC)")
        i = body.find(needle, i + 1)
i = b.find(b"ALIB\x01XX00", 0x4FDB, 0x4FDB + 160)
print(f"DSDT +{i:#06x}: {b[i:i+9].hex(' ')}    ALIB (One, XX00)  (inside _PSR)")
