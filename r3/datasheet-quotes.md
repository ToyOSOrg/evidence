# The 82574 datasheet passages #1075 relies on

**Document:** Intel 82574 GbE Controller Family Datasheet, Intel document 317694, Revision 3.4, June 2014.
- **Fetched from:** https://cdrdv2-public.intel.com/317694/82574l-gbe-controller-datasheet.pdf
- **File:** `82574l-gbe-controller-datasheet.pdf`, 4,434,581 bytes, SHA-256 `3c2b52169f19ae872303d2e89bd5469d151e284e4b3477540d6ae808cde488e3`.
- **Text:** extracted page by page (`=== PAGE n ===` is the PDF's page n).
- **Quotes:** verbatim from that text, with the extraction's line breaks kept.
- **Note:** the driver's header cites revision 2.7 (317694-018). Where compared, the section numbers here match, except `TXDCTL`, which rev 3.4 numbers §10.2.6.11.

## §10.2.6.1 Transmit Control Register - TCTL (PDF pp. 348–349)

```
Transmit Control Register - TCTL (0x00400; RW)
Field
Bit(s)
Initial 
Value
Description
Reserved
0
0b
Reserved
Write as 0b for future compatibility.
EN
1
0b
Enable
The transmitter is enabled when this bit is set to 1b. Writing this bit to 
0b stops transmission after any in progress packets are sent. Data 
remains in the transmit FIFO until the device is re-enabled. Software 
should combine this with a reset if the packets in the FIFO need to be 
flushed.
Reserved
2
0b
Reserved
Reads as 0b. Should be written to 0b for future compatibility.
PSP
3
1b
Pad short packets (with valid data, NOT padding symbols).
0b = do not pad
1b = pad. 
Padding makes the packet 64 bytes. This is not the same as the 
minimum collision distance.
If padding of short packet is allowed, the value in TX descriptor length 
field should be not less than 17 bytes.
CT
11:4
0x0
Collision Threshold
This determines the number of attempts at re-transmission prior to 
giving up on the packet (not including the first transmission attempt). 
While this can be varied, it should be set to a value of 15 in order to 
comply with the IEEE specification requiring a total of 16 attempts. 
The Ethernet back-off algorithm is implemented and clamps to the 
maximum number of slot times after 10 retries. This field only has 
meaning while in half-duplex operation.
COLD
21:12
0b
Collision Distance
Specifies the minimum number of byte times that must elapse for 
proper CSMA/CD operation. Packets are padded with special symbols, 
not valid data bytes. Hardware checks and pads to this value plus one 
byte even in full-duplex operation.
SWXOFF
22
0b
Software XOFF Transmission
When set to 1b, the device schedules the transmission of an XOFF 
(PAUSE) frame using the current value of the pause timer. This bit self 
clears upon transmission of the XOFF frame.
PBE
23
0b
Packet Burst Enable
The 82574L does not support packet bursting for 1 Gb/s half-duplex 
transmit operation. This bit must be set to 0b.
RTLC
24
0b
Re-Transmit on Late Collision
Enables the device to re-transmit on a late collision event. This bit is 
ignored in full-duplex mode.
UNORTX
25
Under run No Re-Transmit
TXDSCMT
27:26
Tx Descriptor Minimum Threshold
MULR
28
1b
Multiple Request Support
This bit defines the number of read requests the 82574 issues for 
transmit data. When set to 0b, the 82574 submits only one request at 
a time, When set to 1b, the 82574 might submit up to four concurrent 
requests. The software device driver must not modify this register 
when the Tx head register is not equal to the tail register.
This bit is loaded from the NVM word 0x24/0x14.

=== PAGE 349 ===
 
347
Driver Programming Interface—82574 GbE Controller
Two fields deserve special mention: CT and COLD. Software might choose to abort 
packet transmission in less than the Ethernet mandated 16 collisions. For this reason, 
hardware provides CT.
Wire speeds of 1000 Mb/s result in a very short collision radius with traditional 
minimum packet sizes. COLD specifies the minimum number of bytes in the packet to 
satisfy the desired collision distance. It is important to note that the resulting packet 
has special characters appended to the end. These are NOT regular data characters. 
Hardware strips special characters for packets that go from 1000 Mb/s environments to 
100 Mb/s environments. Note that the hardware evaluates this field against the packet 
size in full duplex as well.
Note:
While 802.3x flow control is only defined during full duplex operation, the sending of 
pause frames via the SWXOFF bit is not gated by the duplex settings within the device. 
Software should not write a 1b to this bit while the device is configured for half-duplex 
operation.
RTLC configures the 82574 to perform retransmission of packets when a late collision 
is detected.   Note that the collision window is speed dependent: 64 bytes for 10/
100 Mb/s and 512 bytes for 1000 Mb/s operation. If a late collision is detected when 
this bit is disabled, the transmit function assumes the packet is successfully 
transmitted. This bit is ignored in full-duplex mode.
10.2.6.2
Transmit IPG Register - TIPG (0x00410; RW)
RRTHRESH
30:29
01b
Read Request Threshold
These bits define the threshold size for the intermediate buffer to 
determine when to send the read command to the packet buffer. 
Threshold is defined as follows:
RRTHRESH = 00b threshold = 2 lines of 16 bytes
RRTHRESH = 01b threshold = 4 lines of 16 bytes
RRTHRESH = 10b threshold = 8 lines of 16 bytes
RRTHRESH = 11b threshold = No threshold (transfer data after all of 
the request is in the RFIFO) 
Reserved
31
0b
Reserved
Reads as 0b. Should be written to 0b for future compatibility.
Field
Bit(s)
```

The initial-value column for the fields the bring-up writes:
- `PSP` 1b; `CT` 0x0; `COLD` 0b.
- `UNORTX` (25) and `TXDSCMT` (27:26) carry no initial value.

## §4.6.6 Transmit Initialization (PDF p. 83)

```
4.6.6
Transmit Initialization
Program the TXDCTL register with the desired TX descriptor write-back policy. 
Suggested values are:
• GRAN = 1b (descriptors)
• WTHRESH = 1b
• All other fields 0b.
Program the TCTL register. Suggested configuration:
• CT = 0x0F    (16d collision)
• COLD:   HDX = 511 (0x1FF); FDX = 63 (0x03F)
• PSP = 1b
• EN=1b
• All other fields 0b
The following should be done once per transmit queue:
• Allocate a region of memory for the transmit descriptor list.
• Program the descriptor base address with the address of the region.
• Set the length register to the size of the descriptor ring.
• If needed, program the head and tail registers.
```

## §7.2.7 Pipelined Tx Data Read Requests (PDF p. 164)

```
Pipelined Tx Data Read Requests
Transmit data request pipelining is the process by which a request for transmit data is 
sent to the host memory before the read DMA request of the previously requested data 
completes. Transmit pipeline requests is enabled using the MULR bit in the Transmit 
Control (TCTL) register, Its initial value is loaded from the NVM.
The 82574L supports four pipelined requests from the Tx data DMA. In general, the 
four requests can belong to the same packet or to consecutive packets. However, the 
```
