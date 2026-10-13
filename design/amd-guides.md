# AMD revision guides: erratum 1386

Every public AMD revision guide under `www.amd.com/content/dam/amd/en/documents/processor-tech-docs/revision-guides/` that the Internet Archive holds. The CDX listing is below. `www.amd.com` itself did not answer from the development host within 90 s (curl exits 28 and 56). Each file was fetched as `https://web.archive.org/web/<timestamp>id_/<url>`, and its SHA-1, in base32, equals the archive's CDX digest. Text was extracted with PyMuPDF 1.28.0.

| file | archived | sha256 | CDX digest = sha1 | title, revision |
|---|---|---|---|---|
| 55449.pdf | 20240223170636 | `c82bdc31bcdd630ccfe003b662673a037978896271204a81f4b304b33293226f` | BVQNRF6OSBTMXHCWNYWNGR6N2FUEV23R = BVQNRF6OSBTMXHCWNYWNGR6N2FUEV23R | Revision Guide for AMD Family 17h Models 00h-0Fh Processors Publication # 55449        Revision: 1.21  |
| 56323-PUB_1_01.pdf | 20231126211219 | `68f7a242867cf849bc03d53c875a5981ca72a1cb3951a1267fd8b06dbe14359c` | HT34GXCN5JKPIKJ72FYEXKUXE3DTNF5X = HT34GXCN5JKPIKJ72FYEXKUXE3DTNF5X | Revision Guide for AMD Family 17h Models 30h-3Fh Processors Publication # 56323        Revision: 1.01  |
| 56683.pdf | 20240202122951 | `f3029f3daadc54ca891a97b2481ef6945027c1304a117c4a168e87686479af08` | K4KLLE3VSZBWSEXZHXFZ2RUCGRNWAXVF = K4KLLE3VSZBWSEXZHXFZ2RUCGRNWAXVF | Revision Guide for AMD Family 19h Models 00h-0Fh Processors Publication # 56683        Revision: 1.08  |
| 57095-PUB_1_01.pdf | 20240207142445 | `00e9ad662fd55d3826b8d39750276f696e02ea039b86231872faf74f991bb254` | BSSQU2FRDMCU35AWOEA5HH4P4EVU6BC3 = BSSQU2FRDMCU35AWOEA5HH4P4EVU6BC3 | Revision Guide for AMD Family 19h Models 10h-1Fh Processors Publication # 57095        Revision: 1.01  |
| 58251.pdf | 20250304131128 | `541be14a5b2a6a4e9a0b1383492d09a28c061ee57eb969d5cfd5c8ed75a5c231` | LMAAHXVHMU5E4FB3K4MYDND7DLEAUCSY = LMAAHXVHMU5E4FB3K4MYDND7DLEAUCSY | Revision Guide for AMD Family 1Ah Models 00h-0Fh Processors Publication Number: 58251    Revision: 1.10 Date: March 2025 =====PAGE 2=====  |
| 58730.pdf | 20250326125322 | `67fd1c3a0fac3c26b352ef6d63c353b622dbe09ee63b373377f61a8a42e0505f` | G6YHRLLBEO3UCXVOWLEVMODIZIQ5H6VP = G6YHRLLBEO3UCXVOWLEVMODIZIQ5H6VP | Revision Guide for AMD Family 1Ah Models 10h-1Fh Processors Publication Number: 58730    Revision: 1.10 Date: March 2025    |

## Erratum 1386 as 55449 states it (PDF p. 93)

```text
1386 XSAVES Instruction May Fail to Save XMM Registers to
the Provided State Save Area
Description
The XSAVES instruction may fail to save XMM registers to the provided state save area if all of the following
are true:
•
All XMM registers were restored to the initialization value by the most recent XRSTORS instruction because
the XSTATE_BV[SSE] bit was clear.
•
The state save area for the XMM registers does not contain the initialization state.
•
The value in the XMM registers match the initialization value when the XSAVES instruction is executed.
•
The MXCSR register has been modified to a value different from the initialization value since the most recent
XRSTORS instruction.
Potential Effect on System
A process may observe a non-zero value in an XMM register that should be zero.
This observed value will be a previous XMM value from the same process.
Suggested Workaround
System software may contain the workaround for this erratum.
Fix Planned
No fix planned
55449  Rev. 1.21  August 2023
Revision Guide for AMD Family 17h Models 00h-0Fh Processors
Product Errata
93
=====PAGE 94=====
1394 Processor May Cause Unexpected Collisions on SMBUS
```

## Which revision each guide lists it against

The extracted text loses table columns, so `xref.py` and `hdr.py` (below) print the words of the cross-reference table's header and of erratum 1386's row with their x positions. The revision is the header column under the mark.

### 55449

```text
== page 15
  row: 1386@70 XSAVES@102 Instruction@137 May@163 Fail@179 to@190 Save@203 XMM@223 Registers@250 to@270 the@280 Provided@301 State@326 Save@343 Area@361 X@480
y=26 x=435 17h
y=26 x=494 00h-0Fh
y=27 x=411 Family
y=27 x=460 Models
y=27 x=535 Processors
y=72 x=494 Fn0000_0001_EAX
y=73 x=446 CPUID
y=85 x=70 No.
y=89 x=430 00800F11h
y=89 x=480 00800F12h
y=89 x=530 00800F82h
y=98 x=430 (ZP-B1)
y=98 x=480 (ZP-B2)
y=98 x=530 (PiR-B2)
```

### 56323-PUB_1_01

```text
== page 12
  row: 1386@70 XSAVES@102 Instruction@137 May@163 Fail@179 to@190 Save@203 XMM@223 Registers@250 to@270 the@280 Provided@301 State@326 Save@343 Area@361 No@499 fix@510 planned@529
y=26 x=451 56323
y=26 x=477 Rev.
y=26 x=498 1.01
y=26 x=545 2023
y=27 x=522 April
y=73 x=518 CPUID
y=82 x=518 Fn0000_0001_EAX
y=90 x=70 No.
y=98 x=504 00830F10h
y=98 x=537 (Rome-
y=108 x=518 B0)
```

### 56683

```text
== page 12
  row: 1386@70 XSAVES@102 Instruction@137 May@163 Fail@179 to@190 Save@203 XMM@223 Registers@250 to@270 the@280 Provided@301 State@326 Save@343 Area@361 No@486 fix@498 planned@517
y=26 x=443 56683
y=26 x=470 Rev.
y=26 x=490 1.08
y=26 x=545 2023
y=27 x=518 August
y=73 x=505 CPUID
y=82 x=505 Fn0000_0001_EAX
y=91 x=70 No.
y=100 x=480 00A00F11h
y=100 x=530 00A00F12h
y=110 x=480 (Milan-B1)
y=110 x=530 (Milan-B2)
```

Reading: in 55449 the one `X` (x=480) sits under 00800F12h (ZP-B2). 00800F11h (ZP-B1, x=430) and 00800F82h (PiR-B2, x=530) carry none. In 56323 the cell under 00830F10h (Rome-B0), the guide's one revision, reads "No fix planned". In 56683 "No fix planned" spans x=486-517, across 00A00F11h (Milan-B1, x=480) and 00A00F12h (Milan-B2, x=530).

## The guides that do not list it

- `57095-PUB_1_01`: `rg -c 'XSAVES|1386'` prints nothing (exit 1); its text has 160 lines that begin with a four-digit erratum number, so it decodes. 57095 covers 00A10F11h (Genoa-B1) alone; 58251 and 58730 are family 1Ah.
- `58251`: `rg -c 'XSAVES|1386'` prints nothing (exit 1); its text has 186 lines that begin with a four-digit erratum number, so it decodes. 57095 covers 00A10F11h (Genoa-B1) alone; 58251 and 58730 are family 1Ah.
- `58730`: `rg -c 'XSAVES|1386'` prints nothing (exit 1); its text has 176 lines that begin with a four-digit erratum number, so it decodes. 57095 covers 00A10F11h (Genoa-B1) alone; 58251 and 58730 are family 1Ah.

## CDX listing

```text
https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/revision-guides/55449.pdf 20240223170636 200 BVQNRF6OSBTMXHCWNYWNGR6N2FUEV23R
https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/revision-guides/56323-PUB_1_01.pdf 20231126211219 200 HT34GXCN5JKPIKJ72FYEXKUXE3DTNF5X
https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/revision-guides/56683.pdf 20240202122951 200 K4KLLE3VSZBWSEXZHXFZ2RUCGRNWAXVF
https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/revision-guides/57095-PUB_1_01.pdf 20240207142445 200 BSSQU2FRDMCU35AWOEA5HH4P4EVU6BC3
https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/revision-guides/58251.pdf 20250304131128 200 LMAAHXVHMU5E4FB3K4MYDND7DLEAUCSY
https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/revision-guides/58730.pdf 20250326125322 200 G6YHRLLBEO3UCXVOWLEVMODIZIQ5H6VP
```

## The scripts

### extract.py

```python
import sys, fitz
src, dst = sys.argv[1], sys.argv[2]
doc = fitz.open(src)
with open(dst, "w") as out:
    for i, page in enumerate(doc):
        out.write(f"=====PAGE {i+1}=====\n")
        out.write(page.get_text())
```

### xref.py

```python
# Prints, for each page holding a "Cross-Reference of Processor Revision to Errata" table,
# the header words above the first row and the words on erratum 1386's row, with x positions.
import sys, fitz
doc = fitz.open(sys.argv[1])
for pno, page in enumerate(doc):
    text = page.get_text()
    if "Cross-Reference of Processor Revision to Errata" not in text:
        continue
    words = page.get_text("words")  # x0,y0,x1,y1,word,block,line,wno
    rows = [w for w in words if w[4] == "1386"]
    if not rows:
        continue
    print(f"== page {pno+1}")
    first_num = min((w for w in words if w[4].isdigit() and len(w[4]) == 4), key=lambda w: w[1])
    for w in sorted(words, key=lambda w: (round(w[1]), w[0])):
        if w[1] < first_num[1] - 1 and w[1] > first_num[1] - 120:
            print(f"  header y={w[1]:.0f} x={w[0]:.0f}-{w[2]:.0f} {w[4]}")
    for r in rows:
        band = [w for w in words if abs((w[1]+w[3])/2 - (r[1]+r[3])/2) < 6]
        print("  row:", " ".join(f"{w[4]}@{(w[0]+w[2])/2:.0f}" for w in sorted(band, key=lambda w: w[0])))
```

### hdr.py

```python
# Prints the words of the header of the revision-to-errata cross-reference table on the
# page that holds erratum 1386's row, from the page top to that row, with x centres.
import sys, fitz
doc = fitz.open(sys.argv[1])
pno = int(sys.argv[2]) - 1
page = doc[pno]
words = page.get_text("words")
row = [w for w in words if w[4] == "1386"][0]
first = min((w for w in words if w[4].isdigit() and len(w[4]) == 4 and w[0] < 80), key=lambda w: w[1])
for w in sorted(words, key=lambda w: (round(w[1]), w[0])):
    if w[1] < first[1] - 1:
        print(f"y={w[1]:.0f} x={(w[0]+w[2])/2:.0f} {w[4]}")
```
