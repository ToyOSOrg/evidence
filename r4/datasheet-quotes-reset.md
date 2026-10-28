# §4.2 Reset Operation, the software reset (PDF p. 64), from the same document as r3/datasheet-quotes.md

```
• Software Reset - Software can reset the 82574 by writing the Device Reset bit of 
the Device Control (CTRL.RST) register. The 82574L re-reads the per-function NVM 
fields after a software reset. Bits that are normally read from the NVM are reset to 
their default hardware values. Note that this reset is per function and resets only 
the function that received the software reset. PCI configuration space 
(configuration and mapping) of the device is unaffected.
```
