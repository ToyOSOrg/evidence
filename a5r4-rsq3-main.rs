//! Scratch measurement for ToyOS PR #877's A5, round 3: soundserver's resampler
//! against the analytic sine, over the band and the client rates soundserver
//! accepts, on one rubato interpolator named on the command line and built
//! explicitly, as the proposed host test builds it. Not production; it never lands.
//!
//! `rsq3 sweep <sse|avx|neon>`       every configuration, every pair, every tone
//! `rsq3 testpoints <sse|avx|neon>`  the proposed host test's points
//! `rsq3 cost <sse|avx|neon>`        wall time per 128-frame output period
//! `rsq3 probe <sse|avx|neon>`       the CPU's features, and whether the explicit
//!                                   build's output is bit-identical to rubato's
//!                                   own `SincFixedOut::new` on this process
use rubato::sinc_interpolator::SincInterpolator;
use rubato::{
    calculate_cutoff, Resampler, SincFixedOut, SincInterpolationParameters,
    SincInterpolationType, WindowFunction,
};
use std::f64::consts::PI;

/// soundserver's device period: the resampler's fixed output chunk.
const PERIOD: usize = 128;
const CHANNELS: usize = 2;
/// The test tone, as AES17 measures THD+N.
const AMP_DBFS: f64 = -1.0;
/// The client rates the sweep covers: MIN_CLIENT_RATE to MAX_CLIENT_RATE,
/// through every rate in common use.
const CLIENTS: [u32; 12] =
    [8000, 11025, 16000, 22050, 24000, 32000, 44100, 48000, 88200, 96000, 176400, 192000];
const DEVICES: [u32; 2] = [44100, 48000];
/// The manufacturer's band edges, as fractions of the lower of the two rates
/// (TI SRC4192/SRC4193 datasheet, SBFS022C, digital interpolation and
/// decimation filter characteristics).
const PASS_EDGE: f64 = 0.4535;
const STOP_EDGE: f64 = 0.5465;

#[derive(Clone, Copy)]
enum Len {
    /// The same length in input frames at every ratio.
    Fixed,
    /// Scaled so the filter spans the same number of frames of the lower rate.
    Scaled,
    /// Scaled, and the table's oversampling scaled down with it.
    ScaledOsf,
}

#[derive(Clone, Copy)]
struct Cfg {
    name: &'static str,
    len: usize,
    osf: usize,
    cubic: bool,
    cutoff: Option<f32>, // None: rubato::calculate_cutoff(len, BlackmanHarris2)
    scale: Len,
}

const CFGS: [Cfg; 5] = [
    Cfg { name: "today 128/128 cubic fc0.95", len: 128, osf: 128, cubic: true, cutoff: Some(0.95), scale: Len::Fixed },
    Cfg { name: "r1 512/256 cubic fc=calc(512)", len: 512, osf: 256, cubic: true, cutoff: None, scale: Len::Fixed },
    Cfg { name: "scaled 512/256 cubic fc=calc(512)", len: 512, osf: 256, cubic: true, cutoff: None, scale: Len::Scaled },
    Cfg { name: "scaled+osf 512/256 cubic fc=calc(512)", len: 512, osf: 256, cubic: true, cutoff: None, scale: Len::ScaledOsf },
    Cfg { name: "scaled+osf 512/256 LINEAR fc=calc(512)", len: 512, osf: 256, cubic: false, cutoff: None, scale: Len::ScaledOsf },
];

/// The bounds under test. Passband ripple: the TI SRC4192's interpolation
/// filter, +-0.007 dB. Stop band and in-band THD+N: SoX's `rate -h`, "16-bit
/// mastering (use with dither)", 125 dB.
const RIPPLE_DB: f64 = 0.007;
const REJECT_DB: f64 = 125.0;
/// The TPDF-dithered 16-bit wire's own noise below a full-scale sine:
/// 10 log10(2^30 / 2 / (1/4)), and below the -1 dBFS test tone.
fn wire_noise_below_tone() -> f64 {
    10.0 * (2f64.powi(31)).log10() + AMP_DBFS
}

fn params(cfg: Cfg, fin: u32, fout: u32) -> (SincInterpolationParameters, usize, usize) {
    let down = fin as f64 / fout as f64; // > 1 when downsampling
    let (len, osf) = match cfg.scale {
        Len::Fixed => (cfg.len as f64, cfg.osf),
        Len::Scaled => (cfg.len as f64 * down.max(1.0), cfg.osf),
        Len::ScaledOsf => (cfg.len as f64 * down.max(1.0), ((cfg.osf as f64) / down.max(1.0)).ceil() as usize),
    }
    .pipe(|(l, o)| (8 * ((l / 8.0).ceil() as usize), o));
    let cutoff = cfg.cutoff.unwrap_or_else(|| calculate_cutoff::<f32>(cfg.len, WindowFunction::BlackmanHarris2));
    let p = SincInterpolationParameters {
        sinc_len: len,
        f_cutoff: cutoff,
        interpolation: if cfg.cubic { SincInterpolationType::Cubic } else { SincInterpolationType::Linear },
        oversampling_factor: osf,
        window: WindowFunction::BlackmanHarris2,
    };
    (p, len, osf)
}

trait Pipe: Sized {
    fn pipe<R>(self, f: impl FnOnce(Self) -> R) -> R {
        f(self)
    }
}
impl<T> Pipe for T {}

#[derive(Clone, Copy, PartialEq, Debug)]
enum Interp {
    Sse,
    Avx,
    Neon,
}

static INTERP: std::sync::OnceLock<Interp> = std::sync::OnceLock::new();

fn interp() -> Interp {
    *INTERP.get().expect("interpolator chosen")
}

/// The interpolator rubato's `make_interpolator` (`asynchro_sinc.rs:145-189`)
/// would build at this ratio, as the named kind: the sinc length rounded up to
/// a multiple of 8, the cutoff scaled by the ratio below 1. A kind this CPU
/// cannot run panics, naming the missing feature.
fn build_interpolator(kind: Interp, p: &SincInterpolationParameters, ratio: f64) -> Box<dyn SincInterpolator<f32>> {
    let len = 8 * (((p.sinc_len as f32) / 8.0).ceil() as usize);
    let cutoff = if ratio >= 1.0 { p.f_cutoff } else { p.f_cutoff * ratio as f32 };
    match kind {
        #[cfg(target_arch = "x86_64")]
        Interp::Sse => Box::new(
            rubato::sinc_interpolator::sinc_interpolator_sse::SseInterpolator::<f32>::new(len, p.oversampling_factor, cutoff, p.window)
                .unwrap_or_else(|e| panic!("SseInterpolator: {e:?}")),
        ),
        #[cfg(target_arch = "x86_64")]
        Interp::Avx => Box::new(
            rubato::sinc_interpolator::sinc_interpolator_avx::AvxInterpolator::<f32>::new(len, p.oversampling_factor, cutoff, p.window)
                .unwrap_or_else(|e| panic!("AvxInterpolator: {e:?}")),
        ),
        #[cfg(target_arch = "aarch64")]
        Interp::Neon => Box::new(
            rubato::sinc_interpolator::sinc_interpolator_neon::NeonInterpolator::<f32>::new(len, p.oversampling_factor, cutoff, p.window)
                .unwrap_or_else(|e| panic!("NeonInterpolator: {e:?}")),
        ),
        #[allow(unreachable_patterns)]
        other => panic!("{other:?} does not exist on this architecture"),
    }
}

fn interp_type(p: &SincInterpolationParameters) -> SincInterpolationType {
    match p.interpolation {
        SincInterpolationType::Cubic => SincInterpolationType::Cubic,
        SincInterpolationType::Linear => SincInterpolationType::Linear,
        SincInterpolationType::Quadratic => SincInterpolationType::Quadratic,
        SincInterpolationType::Nearest => SincInterpolationType::Nearest,
    }
}

fn resampler_with(kind: Interp, cfg: Cfg, fin: u32, fout: u32) -> SincFixedOut<f32> {
    let (p, _, _) = params(cfg, fin, fout);
    let ratio = fout as f64 / fin as f64;
    let it = build_interpolator(kind, &p, ratio);
    SincFixedOut::<f32>::new_with_interpolator(ratio, 2.0, interp_type(&p), it, PERIOD, CHANNELS).unwrap()
}

fn resampler(cfg: Cfg, fin: u32, fout: u32) -> SincFixedOut<f32> {
    resampler_with(interp(), cfg, fin, fout)
}

/// rubato's own dispatch, as soundserver calls it today.
fn resampler_dispatch(cfg: Cfg, fin: u32, fout: u32) -> SincFixedOut<f32> {
    let (p, _, _) = params(cfg, fin, fout);
    SincFixedOut::<f32>::new(fout as f64 / fin as f64, 2.0, p, PERIOD, CHANNELS).unwrap()
}

/// The output of a `freq` sine at `fin` through the resampler, channel 0, from
/// the first frame past the start-up transient; and that frame's index.
fn run(cfg: Cfg, fin: u32, fout: u32, freq: f64, amp: f64, seconds: f64) -> (Vec<f32>, usize) {
    run_on(resampler(cfg, fin, fout), fin, fout, freq, amp, seconds)
}

fn run_on(mut rs: SincFixedOut<f32>, fin: u32, fout: u32, freq: f64, amp: f64, seconds: f64) -> (Vec<f32>, usize) {
    let skip = rs.output_delay() + 4096;
    let total = skip + (fout as f64 * seconds) as usize;
    let mut out: Vec<f32> = Vec::with_capacity(total + PERIOD);
    let mut outbuf = rs.output_buffer_allocate(true);
    let mut n_in: u64 = 0;
    let mut chunk = vec![vec![0f32; rs.input_frames_max()]; CHANNELS];
    while out.len() < total {
        let need = rs.input_frames_next();
        for i in 0..need {
            let t = (n_in + i as u64) as f64 / fin as f64;
            let v = (amp * (2.0 * PI * freq * t).sin()) as f32;
            for c in 0..CHANNELS {
                chunk[c][i] = v;
            }
        }
        n_in += need as u64;
        let slices: Vec<&[f32]> = chunk.iter().map(|c| &c[..need]).collect();
        let (_, produced) = rs.process_into_buffer(&slices, &mut outbuf, None).unwrap();
        out.extend_from_slice(&outbuf[0][..produced]);
    }
    out.truncate(total);
    (out.split_off(skip), skip)
}

/// IEEE 1057's three-parameter fit at a known frequency: `y ≈ a cos + b sin + c`.
/// Returns the fitted gain in dB against `amp`, and the residual's level below
/// the fitted tone in dB (THD+N, unweighted, the whole output band).
fn fit(ys: &[f32], n0: usize, freq: f64, fout: u32, amp: f64) -> (f64, f64) {
    let w = 2.0 * PI * freq / fout as f64;
    let mut m = [[0f64; 3]; 3];
    let mut r = [0f64; 3];
    for (k, &y) in ys.iter().enumerate() {
        let n = (k + n0) as f64;
        let v = [(w * n).cos(), (w * n).sin(), 1.0];
        for i in 0..3 {
            for j in 0..3 {
                m[i][j] += v[i] * v[j];
            }
            r[i] += y as f64 * v[i];
        }
    }
    let det = |m: [[f64; 3]; 3]| {
        m[0][0] * (m[1][1] * m[2][2] - m[1][2] * m[2][1]) - m[0][1] * (m[1][0] * m[2][2] - m[1][2] * m[2][0])
            + m[0][2] * (m[1][0] * m[2][1] - m[1][1] * m[2][0])
    };
    let d = det(m);
    let mut s = [0f64; 3];
    for i in 0..3 {
        let mut mi = m;
        for j in 0..3 {
            mi[j][i] = r[j];
        }
        s[i] = det(mi) / d;
    }
    let (mut err, mut sig) = (0f64, 0f64);
    for (k, &y) in ys.iter().enumerate() {
        let n = (k + n0) as f64;
        let f = s[0] * (w * n).cos() + s[1] * (w * n).sin() + s[2];
        err += (y as f64 - f).powi(2);
        sig += (f - s[2]).powi(2);
    }
    (20.0 * ((s[0] * s[0] + s[1] * s[1]).sqrt() / amp).log10(), 10.0 * (sig / err).log10())
}

/// A tone above the lower rate's stop edge, downsampled: everything that comes
/// out is alias, in dB below the input tone.
fn rejection(cfg: Cfg, fin: u32, fout: u32, freq: f64, amp: f64) -> f64 {
    rejection_over(cfg, fin, fout, freq, amp, 1.0)
}

fn rejection_over(cfg: Cfg, fin: u32, fout: u32, freq: f64, amp: f64, seconds: f64) -> f64 {
    let (ys, _) = run(cfg, fin, fout, freq, amp, seconds);
    let rms = (ys.iter().map(|&y| (y as f64).powi(2)).sum::<f64>() / ys.len() as f64).sqrt();
    -20.0 * (rms / (amp / 2f64.sqrt())).log10()
}

/// ISO 266's third-octave centres from 20 Hz to 20 kHz, 997 Hz (AES17's test
/// frequency), and the passband's own edge where it is under 20 kHz.
fn passband(fin: u32, fout: u32) -> Vec<f64> {
    let edge = (PASS_EDGE * fin.min(fout) as f64).min(20_000.0);
    let iso = [
        20.0, 25.0, 31.5, 40.0, 50.0, 63.0, 80.0, 100.0, 125.0, 160.0, 200.0, 250.0, 315.0, 400.0, 500.0,
        630.0, 800.0, 997.0, 1000.0, 1250.0, 1600.0, 2000.0, 2500.0, 3150.0, 4000.0, 5000.0, 6300.0, 8000.0,
        10000.0, 12500.0, 16000.0, 20000.0,
    ];
    let mut v: Vec<f64> = iso.iter().copied().filter(|&f| f < edge).collect();
    v.push(edge);
    v
}

/// Whether the pair has a stop band at all: downsampling, with the stop edge
/// under the client's Nyquist. 48 -> 44.1 kHz has none: its edge, 24100.6 Hz,
/// is above 24 kHz.
fn has_stopband(fin: u32, fout: u32) -> bool {
    fin > fout && STOP_EDGE * (fout as f64) < 0.499 * fin as f64
}

/// From the stop edge to just under the input's Nyquist, a sixth of an octave apart.
fn stopband(fin: u32, fout: u32) -> Vec<f64> {
    let lo = STOP_EDGE * fout as f64;
    let hi = 0.499 * fin as f64;
    assert!(lo < hi, "{fin} -> {fout} has no stop band");
    let mut v = Vec::new();
    let mut f = lo;
    while f < hi {
        v.push(f);
        f *= 2f64.powf(1.0 / 6.0);
    }
    v.push(hi);
    v
}

fn interpolator() -> String {
    format!("{:?}, built explicitly; this CPU: {}", interp(), cpu())
}

fn cpu() -> String {
    #[cfg(target_arch = "x86_64")]
    {
        format!(
            "x86_64: avx={} fma={} -> rubato's own dispatch takes {}",
            std::is_x86_feature_detected!("avx"),
            std::is_x86_feature_detected!("fma"),
            if std::is_x86_feature_detected!("avx") && std::is_x86_feature_detected!("fma") {
                "AvxInterpolator"
            } else if std::is_x86_feature_detected!("sse3") {
                "SseInterpolator"
            } else {
                "ScalarInterpolator"
            }
        )
    }
    #[cfg(target_arch = "aarch64")]
    {
        format!(
            "aarch64: neon={} -> rubato's own dispatch takes {}",
            std::arch::is_aarch64_feature_detected!("neon"),
            if std::arch::is_aarch64_feature_detected!("neon") { "NeonInterpolator" } else { "ScalarInterpolator" }
        )
    }
}

fn pairs() -> Vec<(u32, u32)> {
    let mut v = Vec::new();
    for &d in &DEVICES {
        for &c in &CLIENTS {
            if c != d {
                v.push((c, d));
            }
        }
    }
    v
}

fn sweep() {
    let amp = 10f64.powf(AMP_DBFS / 20.0);
    println!("interpolator: {}", interpolator());
    println!("tone {AMP_DBFS} dBFS; output {PERIOD}-frame chunks, {CHANNELS} channels; 2 s fitted per in-band tone, 1 s per stop-band tone");
    // Jobs: one per (cfg, pair), run on a few threads, printed in order.
    let mut jobs = Vec::new();
    for (ci, &cfg) in CFGS.iter().enumerate() {
        for &(fin, fout) in &pairs() {
            jobs.push((ci, cfg, fin, fout));
        }
    }
    let threads = 6;
    let results: Vec<std::sync::Mutex<Option<String>>> = jobs.iter().map(|_| std::sync::Mutex::new(None)).collect();
    // Per job: worst |gain|, worst THD+N, worst rejection (or +inf), table KiB, and the pair.
    let worst: Vec<std::sync::Mutex<Option<(f64, f64, f64, f64, f64, f64, usize)>>> =
        jobs.iter().map(|_| std::sync::Mutex::new(None)).collect();
    let next = std::sync::atomic::AtomicUsize::new(0);
    std::thread::scope(|s| {
        for _ in 0..threads {
            s.spawn(|| loop {
                let i = next.fetch_add(1, std::sync::atomic::Ordering::Relaxed);
                if i >= jobs.len() {
                    break;
                }
                let (_, cfg, fin, fout) = jobs[i];
                let (_, len, osf) = params(cfg, fin, fout);
                let mut text = String::new();
                let mut worst_gain = (0f64, 0f64);
                let mut worst_thdn = (f64::INFINITY, 0f64);
                for f in passband(fin, fout) {
                    let (ys, n0) = run(cfg, fin, fout, f, amp, 2.0);
                    let (g, t) = fit(&ys, n0, f, fout, amp);
                    text += &format!("  tone {f:>8.1} Hz  gain {g:+.5} dB  THD+N {t:6.1} dB\n");
                    if g.abs() > worst_gain.0.abs() {
                        worst_gain = (g, f);
                    }
                    if t < worst_thdn.0 {
                        worst_thdn = (t, f);
                    }
                }
                let mut worst_rej = (f64::INFINITY, 0f64);
                if has_stopband(fin, fout) {
                    for f in stopband(fin, fout) {
                        let r = rejection(cfg, fin, fout, f, amp);
                        text += &format!("  stop {f:>8.1} Hz  rejected {r:6.1} dB\n");
                        if r < worst_rej.0 {
                            worst_rej = (r, f);
                        }
                    }
                }
                let head = format!(
                    "== {} | {fin} -> {fout} | sinc_len {len} osf {osf} table {} KiB\n  WORST passband gain {:+.5} dB at {:.1} Hz; THD+N {:.1} dB at {:.1} Hz; stop-band {}\n",
                    cfg.name,
                    len * osf * 4 / 1024,
                    worst_gain.0,
                    worst_gain.1,
                    worst_thdn.0,
                    worst_thdn.1,
                    if has_stopband(fin, fout) { format!("{:.1} dB at {:.1} Hz", worst_rej.0, worst_rej.1) } else if fin > fout { "none (the stop edge is above the client's Nyquist)".into() } else { "n/a (upsampling)".into() },
                );
                *results[i].lock().unwrap() = Some(head + &text);
                *worst[i].lock().unwrap() = Some((worst_gain.0, worst_gain.1, worst_thdn.0, worst_thdn.1, worst_rej.0, worst_rej.1, len * osf * 4 / 1024));
            });
        }
    });
    for r in results {
        print!("{}", r.into_inner().unwrap().unwrap());
    }
    let wire = wire_noise_below_tone();
    println!("\n== SUMMARY: bounds passband +-{RIPPLE_DB} dB, in-band THD+N >= {REJECT_DB} dB, stop band >= {REJECT_DB} dB; the dithered 16-bit wire's own noise is {wire:.2} dB below the tone");
    for (ci, cfg) in CFGS.iter().enumerate() {
        let mine: Vec<(usize, (f64, f64, f64, f64, f64, f64, usize))> = jobs
            .iter()
            .enumerate()
            .filter(|(_, j)| j.0 == ci)
            .map(|(i, _)| (i, worst[i].lock().unwrap().unwrap()))
            .collect();
        let g = mine.iter().max_by(|a, b| a.1 .0.abs().total_cmp(&b.1 .0.abs())).unwrap();
        let t = mine.iter().min_by(|a, b| a.1 .2.total_cmp(&b.1 .2)).unwrap();
        let r = mine.iter().min_by(|a, b| a.1 .4.total_cmp(&b.1 .4)).unwrap();
        let kib = mine.iter().map(|m| m.1 .6).max().unwrap();
        let mut fails = Vec::new();
        for (i, w) in &mine {
            let (_, _, fin, fout) = jobs[*i];
            if w.0.abs() > RIPPLE_DB { fails.push(format!("{fin}->{fout} passband")); }
            if w.2 < REJECT_DB { fails.push(format!("{fin}->{fout} THD+N")); }
            if w.4 < REJECT_DB { fails.push(format!("{fin}->{fout} stop band")); }
        }
        let pair = |i: usize| format!("{} -> {}", jobs[i].2, jobs[i].3);
        println!(
            "{}\n  worst gain {:+.5} dB ({} at {:.1} Hz), margin {:.5} dB\n  worst THD+N {:.1} dB ({} at {:.1} Hz), margin {:.1} dB, {:.1} dB under the wire's noise\n  worst stop band {:.1} dB ({} at {:.1} Hz), margin {:.1} dB\n  largest sinc table {} KiB\n  {}",
            cfg.name,
            g.1 .0, pair(g.0), g.1 .1, RIPPLE_DB - g.1 .0.abs(),
            t.1 .2, pair(t.0), t.1 .3, t.1 .2 - REJECT_DB, t.1 .2 - wire,
            r.1 .4, pair(r.0), r.1 .5, r.1 .4 - REJECT_DB,
            kib,
            if fails.is_empty() { "PASS at every pair and tone".to_string() } else { format!("FAIL: {}", fails.join(", ")) },
        );
    }
}

fn cost() {
    println!("interpolator: {}", interpolator());
    println!("wall time per {PERIOD}-frame output period, {CHANNELS} channels, after 2000 warm-up periods: the least of five trials of 2 s of output");
    for &cfg in &CFGS {
        for &(fin, fout) in &[(8000u32, 48000u32), (44100, 48000), (48000, 44100), (96000, 48000), (192000, 44100), (192000, 48000)] {
            let (_, len, osf) = params(cfg, fin, fout);
            let mut rs = resampler(cfg, fin, fout);
            let mut out = rs.output_buffer_allocate(true);
            let inp = vec![vec![0.1f32; rs.input_frames_max()]; CHANNELS];
            let mut step = |rs: &mut SincFixedOut<f32>| {
                let need = rs.input_frames_next();
                let chunk: Vec<&[f32]> = inp.iter().map(|c| &c[..need]).collect();
                rs.process_into_buffer(&chunk, &mut out, None).unwrap();
            };
            for _ in 0..2000 {
                step(&mut rs);
            }
            // The least of five trials of 2 s of output each: on a shared,
            // loaded host the least is the one the fewest other threads cut into.
            let periods = fout as usize * 2 / PERIOD;
            let mut us = f64::INFINITY;
            for _ in 0..5 {
                let t0 = std::time::Instant::now();
                for _ in 0..periods {
                    step(&mut rs);
                }
                us = us.min(t0.elapsed().as_secs_f64() * 1e6 / periods as f64);
            }
            let period_us = PERIOD as f64 * 1e6 / fout as f64;
            println!(
                "{:40} {fin:>6} -> {fout:>5}  sinc_len {len:>4} osf {osf:>3} table {:>5} KiB  {us:7.1} us/period of {period_us:.0} us",
                cfg.name,
                len * osf * 4 / 1024
            );
        }
    }
}

/// The host test the design proposes, at its own points: every pair; 20 Hz,
/// 997 Hz and the passband edge for the passband and THD+N claims; the sweep's
/// own stop-band points, a sixth of an octave apart from the stop edge to 0.499
/// of the client rate, at each pair that has a stop band; half a second of
/// fitted output each. One verdict per claim per configuration.
fn testpoints() {
    let amp = 10f64.powf(AMP_DBFS / 20.0);
    println!("interpolator: {}", interpolator());
    println!("the proposed host test's points, 0.5 s of fitted output each");
    for &ci in &[0usize, 1, 3, 4] {
        let cfg = CFGS[ci];
        let t0 = std::time::Instant::now();
        let mut gain = (0f64, String::new());
        let mut thdn = (f64::INFINITY, String::new());
        let mut stop = (f64::INFINITY, String::new());
        for (fin, fout) in pairs() {
            let edge = (PASS_EDGE * fin.min(fout) as f64).min(20_000.0);
            for f in [20.0, 997.0, edge] {
                let (ys, n0) = run(cfg, fin, fout, f, amp, 0.5);
                let (g, t) = fit(&ys, n0, f, fout, amp);
                if g.abs() > gain.0.abs() {
                    gain = (g, format!("{fin} -> {fout} at {f:.1} Hz"));
                }
                if t < thdn.0 {
                    thdn = (t, format!("{fin} -> {fout} at {f:.1} Hz"));
                }
            }
            if has_stopband(fin, fout) {
                for f in stopband(fin, fout) {
                    let r = rejection_over(cfg, fin, fout, f, amp, 0.5);
                    if r < stop.0 {
                        stop = (r, format!("{fin} -> {fout} at {f:.1} Hz"));
                    }
                }
            }
        }
        let verdict = |ok: bool| if ok { "green" } else { "RED" };
        println!(
            "{}\n  passband: {} (worst {:+.5} dB, {}; margin {:.5} dB)\n  THD+N:    {} (worst {:.1} dB, {}; margin {:.1} dB)\n  stop band: {} (worst {:.1} dB, {}; margin {:.1} dB)\n  {:.1} s for the three claims",
            cfg.name,
            verdict(gain.0.abs() <= RIPPLE_DB), gain.0, gain.1, RIPPLE_DB - gain.0.abs(),
            verdict(thdn.0 >= REJECT_DB), thdn.0, thdn.1, thdn.0 - REJECT_DB,
            verdict(stop.0 >= REJECT_DB), stop.0, stop.1, stop.0 - REJECT_DB,
            t0.elapsed().as_secs_f64(),
        );
    }
}

/// The explicit build against rubato's own dispatch, every configuration and
/// pair, 0.25 s of a 997 Hz tone: bit-identical output is the evidence that the
/// explicit build is the interpolator, sinc length and cutoff `make_interpolator`
/// gives, wherever the dispatch takes the same kind. Exits 1 when any pair
/// differs, as the fourth host test's assertion would fail.
fn probe() {
    println!("interpolator: {}", interpolator());
    let amp = 10f64.powf(AMP_DBFS / 20.0);
    let (mut same, mut total) = (0, 0);
    for &cfg in &CFGS {
        for (fin, fout) in pairs() {
            let (a, _) = run_on(resampler(cfg, fin, fout), fin, fout, 997.0, amp, 0.25);
            let (b, _) = run_on(resampler_dispatch(cfg, fin, fout), fin, fout, 997.0, amp, 0.25);
            total += 1;
            if a.len() == b.len() && a.iter().zip(&b).all(|(x, y)| x.to_bits() == y.to_bits()) {
                same += 1;
            } else {
                println!("  differs: {} {fin} -> {fout}", cfg.name);
            }
        }
    }
    println!("explicit {:?} against rubato's own dispatch: {same} of {total} configuration-pairs bit-identical", interp());
    if same != total {
        std::process::exit(1);
    }
}

fn main() {
    let kind = match std::env::args().nth(2).as_deref() {
        Some("sse") => Interp::Sse,
        Some("avx") => Interp::Avx,
        Some("neon") => Interp::Neon,
        _ => {
            eprintln!("usage: rsq3 sweep|cost|testpoints|probe sse|avx|neon");
            std::process::exit(2);
        }
    };
    INTERP.set(kind).unwrap();
    match std::env::args().nth(1).as_deref() {
        Some("sweep") => sweep(),
        Some("cost") => cost(),
        Some("probe") => probe(),
        Some("testpoints") => testpoints(),
        _ => {
            eprintln!("usage: rsq3 sweep|cost|testpoints|probe sse|avx|neon");
            std::process::exit(2);
        }
    }
}
