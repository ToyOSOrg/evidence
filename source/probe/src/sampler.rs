//! Rotated sampling of up to five backends per row: two instances of
//! toyos-crypto (A and B, whose disagreement is the row's spread) and the
//! three references. Follows toyos-parity's schedule: each backend's batch is
//! calibrated to at least BATCH_NS, a sample is the mean over batches spanning
//! at least that, one discarded warmup sample, then ROUNDS passes over the
//! whole table of PER_ROUND samples per row; sample i rotates the order by i.

pub const BACKENDS: [&str; 5] = ["toyos-a", "toyos-b", "ring", "openssl", "aws-lc"];
pub const ROUNDS: usize = 3;
pub const PER_ROUND: usize = 10;
pub const BATCH_NS: u64 = 1_000_000;

pub type Op = Box<dyn FnMut(u64)>;

pub struct Row {
    pub name: String,
    pub run: [Option<Op>; 5],
}

pub fn looped(mut op: impl FnMut() + 'static) -> Op {
    Box::new(move |ops| (0..ops).for_each(|_| op()))
}

pub fn now() -> u64 {
    use std::sync::OnceLock;
    use std::time::Instant;
    static START: OnceLock<Instant> = OnceLock::new();
    START.get_or_init(Instant::now).elapsed().as_nanos() as u64
}

fn calibrate(op: &mut Op) -> u64 {
    let mut ops = 1;
    loop {
        let start = now();
        op(ops);
        if now() - start >= BATCH_NS {
            return ops;
        }
        ops *= 2;
    }
}

fn sample(op: &mut Op, ops: u64) -> f64 {
    let start = now();
    let mut done = 0;
    loop {
        op(ops);
        done += ops;
        let took = now() - start;
        if took >= BATCH_NS {
            return took as f64 / done as f64;
        }
    }
}

/// Per row, per backend: nanoseconds per operation in sample order (empty for
/// an absent backend).
pub fn measure(rows: &mut [Row]) -> Vec<[Vec<f64>; 5]> {
    let mut batches = vec![[0u64; 5]; rows.len()];
    let mut times: Vec<[Vec<f64>; 5]> = (0..rows.len()).map(|_| Default::default()).collect();
    for round in 0..ROUNDS {
        for ((row, batch), times) in rows.iter_mut().zip(&mut batches).zip(&mut times) {
            let present: Vec<usize> = (0..5).filter(|&b| row.run[b].is_some()).collect();
            if round == 0 {
                for &b in &present {
                    batch[b] = calibrate(row.run[b].as_mut().unwrap());
                }
                for &b in &present {
                    sample(row.run[b].as_mut().unwrap(), batch[b]);
                }
            }
            for i in round * PER_ROUND..(round + 1) * PER_ROUND {
                for k in 0..present.len() {
                    let b = present[(i + k) % present.len()];
                    let ns = sample(row.run[b].as_mut().unwrap(), batch[b]);
                    times[b].push(ns);
                }
            }
        }
        eprintln!("oracles: round {} of {ROUNDS} done", round + 1);
    }
    times
}

/// The nearest-rank num/den quantile.
pub fn quantile(values: impl IntoIterator<Item = f64>, num: usize, den: usize) -> f64 {
    let mut sorted: Vec<f64> = values.into_iter().collect();
    assert!(!sorted.is_empty());
    sorted.sort_by(f64::total_cmp);
    let rank = (num * sorted.len()).div_ceil(den);
    sorted[rank.max(1) - 1]
}
