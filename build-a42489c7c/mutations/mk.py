import sys, subprocess, os, difflib
W='/Users/jan/Dev/jan/toyos-ps2server'
def patch(name, path, old, new):
    src=open(os.path.join(W,path)).read()
    assert src.count(old)==1, (name, path, src.count(old))
    dst=src.replace(old,new)
    d=difflib.unified_diff(src.splitlines(True), dst.splitlines(True), 'a/'+path, 'b/'+path)
    open(name+'.patch','a').writelines(d)
for f in os.listdir('.'):
    if f.endswith('.patch'): os.remove(f)
P='system/ps2server/src/'
patch('m01-no-read-delay', P+'bus.rs', """        while self.now() < shown + READ_DELAY_NS {
            core::hint::spin_loop();
        }
        self.data()""", """        let _ = shown;
        self.data()""")
patch('m02-write-with-obf-full', P+'bus.rs', """            if status & OBF != 0 {
                found(Byte { value: self.read_after(shown), aux: status & AUXB != 0 });""", """            if false {
                found(Byte { value: self.read_after(shown), aux: status & AUXB != 0 });""")
patch('m03-reserved-command', P+'probe.rs', """        self.command(DISABLE_KEYBOARD, deadline, "0xAD")?;
        self.command(DISABLE_AUX, deadline, "0xA7")?;""", """        self.command(0xAA, deadline, "0xAA")?;
        self.command(DISABLE_KEYBOARD, deadline, "0xAD")?;
        self.command(DISABLE_AUX, deadline, "0xA7")?;""")
patch('m04-0x20-with-keyboard-enabled', P+'probe.rs', """        self.command_byte(byte, deadline)?;
        self.command(READ_COMMAND_BYTE, deadline, "0x20")?;""", """        self.command_byte(byte, deadline)?;
        self.command(ENABLE_KEYBOARD, deadline, "0xAE")?;
        self.command(READ_COMMAND_BYTE, deadline, "0x20")?;""")
patch('m05-answer-before-interrupt', P+'probe.rs', """            let irq = self.c.wait(deadline);
            while let Some(byte) = self.c.poll() {""", """            let irq = if self.c.now() < deadline { Some(Irq { first_nanos: 0 }) } else { None };
            while let Some(byte) = self.c.poll() {""")
patch('m07-aux-stage-bit-4-clear', P+'probe.rs', """const AUX_STAGE: u8 = CB_AUX_IRQ | CB_SYSTEM_FLAG | CB_KEYBOARD_DISABLED | CB_TRANSLATE;""", """const AUX_STAGE: u8 = CB_AUX_IRQ | CB_SYSTEM_FLAG | CB_TRANSLATE;""")
patch('m08-system-flag-0', P+'bus.rs', """pub const CB_SYSTEM_FLAG: u8 = 1 << 2;""", """pub const CB_SYSTEM_FLAG: u8 = 0;""")
patch('m09-no-keyboard-reset', P+'probe.rs', """        self.command(ENABLE_KEYBOARD, deadline, "0xAE")?;
        self.send(Port::Data, RESET, deadline, "the keyboard's reset")?;""", """        self.command(ENABLE_KEYBOARD, deadline, "0xAE")?;
        if true {
            self.scanning = true;
            return Ok(true);
        }
        self.send(Port::Data, RESET, deadline, "the keyboard's reset")?;""")
patch('m10-0xaa-bound-500ms', P+'probe.rs', """pub const KEYBOARD_NS: u64 = 750_000_000;""", """pub const KEYBOARD_NS: u64 = 500_000_000;""")
patch('m11-waiter-for-ported-starts-only', 'lib/manifest/src/lib.rs', """            Start::Spawned => self.restart || !self.serves.is_empty() || !self.roles.is_empty(),""", """            Start::Spawned => !self.serves.is_empty() || !self.roles.is_empty(),""")
patch('m12-no-release-on-a-sources-end', 'lib/input/src/merge.rs', """    pub fn end(&mut self, slot: Slot) -> Delivered {
        self.sources[slot.0].hold(Usages::NONE);
        self.merge()""", """    pub fn end(&mut self, slot: Slot) -> Delivered {
        let _ = slot;
        self.merge()""")
patch('m12-no-release-on-a-sources-end', 'lib/input/src/merge.rs', """        self.buttons[slot.0] = [0; 256];
        self.state(0)""", """        let _ = slot;
        self.state(0)""")
patch('m13-buttons-are-the-last-reports', 'lib/input/src/merge.rs', """        self.buttons[slot.0][usize::from(report.source)] = report.buttons;""", """        self.buttons = [[0; 256]; SLOTS];
        self.buttons[slot.0][usize::from(report.source)] = report.buttons;""")
patch('m14-arrival-to-arrival-gaps', P+'stream.rs', """            if byte.aux {
                self.device_ns += gap.take().unwrap_or(0);
            }""", """            if byte.aux {
                let _ = gap.take();
                if let Some(irq) = irq {
                    self.device_ns = irq.first_nanos;
                }
            }""")
patch('m15-reenable-drops-what-it-found', P+'stream.rs', """        for b in found {
            self.feed(b, out, say);
        }
        sent
    }""", """        let _ = found;
        sent
    }""")
