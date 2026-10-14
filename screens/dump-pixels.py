import sys
p='tests/toyos.rs'
s=open(p).read()
s=s.replace('''    let at_two = window_drawn(&qemu.screendump(), SCALE_BEFORE)?;''','''    let d = qemu.screendump();
    { let mut b = format!("P6 {} {} 255\\n", d.width, d.height).into_bytes(); for p in &d.pixels { b.extend_from_slice(p); } std::fs::write("<scratch>/at-two.ppm", b).unwrap(); }
    let at_two = window_drawn(&d, SCALE_BEFORE)?;''')
s=s.replace('''    let at_one = window_drawn(&qemu.screendump(), SCALE_AFTER)?;''','''    let d = qemu.screendump();
    { let mut b = format!("P6 {} {} 255\\n", d.width, d.height).into_bytes(); for p in &d.pixels { b.extend_from_slice(p); } std::fs::write("<scratch>/at-one.ppm", b).unwrap(); }
    let at_one = window_drawn(&d, SCALE_AFTER)?;''')
open(p,'w').write(s)
