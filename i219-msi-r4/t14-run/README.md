# The final shared T14 boot at 58e0324dd

The orchestrator ran this boot from the image staged at `58e0324dd1aa93dab3a3b9f27536c5af9364ce2e`. The boot carried `claim_reuses_its_remapping_entry` and `i219_messages_on_its_msi_vector` together, and the verdict was `passed`. The judge reported `2 passed, 0 failed, 1 boot(s)`.

Each forced cause gave exactly one message over its full 100 ms window, arriving after 82–157 µs.

`judge-i219c.log` holds the judge output, and `kernel.log` and `loader.log` are the readback. The boot stick's serial number is masked. The images are not published; `images.sha256` gives their hashes.
