# pr-1169 r0: where session_lifecycle's keys drop

- `sl-batch.log.gz`: the line as one `input-send-event` (scratch hook, dev host, before the x86 rule):
  ps2server read 20 bytes, every one decoded; the row stalled on the truncated line.
- `sl-1.log.gz`: one QMP call per key, idle host: 68 of 68 bytes read.
- `remote-scratch.log.gz`: jan-pc, scratch revision d41d8a3d3: a forced overflow, then the paced line: PASS.
- `remote-ps2.log.gz`: jan-pc, the fix 3610f2d50: PASS.
