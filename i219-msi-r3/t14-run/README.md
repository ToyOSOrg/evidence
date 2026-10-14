# The shared T14 boot at 3ab96ea7b

The orchestrator ran this boot from the image staged at `3ab96ea7b16acb74b8b7cdaeb60a344a8e39932b`. The boot carried `claim_reuses_its_remapping_entry` and `i219_messages_on_its_msi_vector` together, and the verdict was `passed`.

The judge reported `2 passed, 0 failed, 1 boot(s)`. Of note:

- The re-claim judge, scoped to its own job, reads `irte0 written by both claims, not present after each release`. This is so even though `i219_msi` claimed the same function on the same boot.
- The transmit wake was asked for twice and taken twice.

The files:

- `judge-i219b.log` holds the judge output.
- `kernel.log` and `loader.log` are the readback.
- `runner.log` is the orchestrator's invocation.
- The boot stick's serial number is masked.
- The images are not published. `images.sha256` gives their hashes.
