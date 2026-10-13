# Stage 1a on the T14, head 75be4bcc7

Two boots, run by the orchestrator from the images staged at `75be4bcc7`
(`../stage-1a/t14-request.txt`). Judge: `judge-1a.log`, `3 passed, 0 failed,
2 boot(s)`; runner log `runner.log`. Readbacks without the disk images; one
USB device serial number masked.

- `testcases-xhci-leave/`: `usbd_drives_the_type_c_controller` PASS, with
  `end_returns_claims` on 00:0d.0 [8086:9a13]: "100 rounds, every claim
  granted after its holder's end; mean kill to end 59 µs, end to claim
  3764 µs" (`testcases-xhci-leave/kernel.log`). The timings are
  printed, not judged.
- `isa/`: `isa_ports_are_the_binders_alone` and
  `isa_lines_reach_their_holder` PASS, with `claim_after` deleted: each
  claim of the i8042 row after its holder's end granted at the first ask.
