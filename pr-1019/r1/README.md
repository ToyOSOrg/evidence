# #1019 review round 1

- **Record only:** stage 6's exit keeps the owner's wording. Ring's leniency on speccheck cases 0, 1, 2 and 11 is recorded as awaiting the owner.
- **The loader's verify time on the benches**, stage 6's last exit, from the probe boots in #1016's round-1 evidence (https://github.com/ToyOSOrg/evidence/tree/221efed2258b7c6e79b82ef67e4014804d98ed32/pr-1016/r1, `bench/{t14,amd}-loader-verify.txt`):
  - T14: 253,975 counter ticks at the stated 2.4192 GHz, about 105 µs.
  - AMD bench: 122,724 ticks; that CPU states no counter rate.
- **Which architecture logged the QEMU timing line:** in round 0's `qemu-bent-supervisor.log` the loader's timing lines are the AArch64 guest's (the virt machine's 62.5 MHz counter). The x86-64 guest's loader log is not echoed there. Its kernel's "slot B, because the marked slot A was refused: hash" shows that slot A's signature verified before its hash refused it.
