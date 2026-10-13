import subprocess, sys
W='<home>/<dev>/toyos-amddesk'
def mut(name, path, pairs):
    p=f'{W}/{path}'; s=open(p).read(); o=s
    for a,b in pairs:
        assert s.count(a)==1,(name,a)
        s=s.replace(a,b)
    open(p,'w').write(s)
    d=subprocess.run(['git','-C',W,'diff','--',path],capture_output=True,text=True).stdout
    open(f'{name}.patch','w').write(d)
    open(p,'w').write(o)
R='system/soundserver/resample/src/lib.rs'
mut('a-todays-parameters',R,[('const SINC_LEN: usize = 512;','const SINC_LEN: usize = 128;'),('const OVERSAMPLING: usize = 256;','const OVERSAMPLING: usize = 128;'),('f_cutoff: calculate_cutoff::<f32>(SINC_LEN, WINDOW),','f_cutoff: 0.95 + 0.0 * calculate_cutoff::<f32>(SINC_LEN, WINDOW),'),('let faster = (client_rate as f64 / device_rate as f64).max(1.0);','let faster = (client_rate as f64 / device_rate as f64).min(1.0).max(1.0);')])
mut('b-round-1-unscaled',R,[('let faster = (client_rate as f64 / device_rate as f64).max(1.0);','let faster = (client_rate as f64 / device_rate as f64).min(1.0).max(1.0);')])
mut('c-linear-interpolation',R,[('const INTERPOLATION: SincInterpolationType = SincInterpolationType::Cubic;','const INTERPOLATION: SincInterpolationType = SincInterpolationType::Linear;')])
mut('d-no-cutoff-scaling','system/soundserver/resample/src/tests.rs',[('let cutoff = if ratio >= 1.0 { p.f_cutoff } else { p.f_cutoff * ratio as f32 };','let cutoff = p.f_cutoff;')])
mut('e-a3-range-test','kernel/ps2/tests/decode.rs',[('(0x04..=0x65).contains(&usage) || (0x7F..=0x81).contains(&usage) || (0xE0..=0xE7).contains(&usage)','(0x04..=0x65).contains(&usage) || (0xE0..=0xE7).contains(&usage)')])
mut('f-a6b-volume-arms','system/compositor/desktop/src/input.rs',[('        return if ev.pressed() { KeyAction::Volume(key) } else { KeyAction::Ignore };','        let _ = key;')])
mut('g-a6b-overlay-never-hides','system/compositor/desktop/src/volume.rs',[('self.shown = Some((shown, now.saturating_add(OVERLAY_HOLD_NANOS)));','self.shown = Some((shown, u64::MAX.max(now)));')])
mut('h-a4-choose-takes-the-first','lib/hda/src/path.rs',[('    if found.iter().filter(|walk| walk.is_ok()).count() != 1 {','    if found.iter().filter(|walk| walk.is_ok()).count() == 0 {')])
mut('i-a6a-step-of-one','lib/hda/src/config.rs',[('        POSITION_QUARTER_DB.div_ceil(self.range.step_size_quarter_db)','        1')])
mut('j-a5-rate-order','system/soundserver/mixer/src/shape.rs',[('pub const DEVICE_RATES: [u32; 2] = [44_100, 48_000];','pub const DEVICE_RATES: [u32; 2] = [48_000, 44_100];')])
