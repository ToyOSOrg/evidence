gop_edid_scale on both benches, image staged at c849397d3 (metalcase), run by
the orchestrator: T14 and AMD bench each PASS.

  T14:  signature 0x806c1, GOP handle 0, panel 309x173 mm, scale 1.5,
        a 200x100 window drawn 300x150
  AMD:  signature 0x860f01, GOP handle 1, panel 309x174 mm, scale 1.5,
        a 200x100 window drawn 300x150

Per bench: judge.log (the row's verdict), m931-<bench>.{txt,log} (the
orchestrator's run manifest), and the readback's text files: boot.txt,
kernel.log, loader.log, verdict.txt, the manifest the image rendered.
Masked: the machines' product, model and BIOS strings, the boot stick's
vendor, product and serial number, and paths. The image and the log
partition are not published.
