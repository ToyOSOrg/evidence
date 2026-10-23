use std::hint::black_box;
use std::time::Instant;
use toyos_crypto::mlkem::{DecapsulationKey, EncapsulationKey};

struct Given<'a>(&'a [u8]);
impl toyos_crypto::Random for Given<'_> {
    fn fill(&mut self, out: &mut [u8]) -> Result<(), toyos_crypto::Error> {
        let (head, rest) = self.0.split_at(out.len());
        out.copy_from_slice(head);
        self.0 = rest;
        Ok(())
    }
}

fn time(name: &str, mut f: impl FnMut()) {
    for _ in 0..200 { f() }
    let mut best = f64::MAX;
    for _ in 0..15 {
        let n = 2000;
        let t = Instant::now();
        for _ in 0..n { f() }
        best = best.min(t.elapsed().as_nanos() as f64 / n as f64);
    }
    println!("{name}: {:.2} us", best / 1000.0);
}

fn main() {
    let seeds = [7u8; 64];
    let m = [9u8; 32];
    let dk = DecapsulationKey::generate(&mut Given(&seeds)).unwrap();
    let pk = dk.public_key().as_bytes().to_vec();
    let ek = EncapsulationKey::from_bytes(&pk).unwrap();
    let (ct, ss) = ek.encapsulate(&mut Given(&m)).unwrap();
    assert_eq!(DecapsulationKey::generate(&mut Given(&seeds)).unwrap().decapsulate(&ct).unwrap().as_bytes(), ss.as_bytes());
    time("keygen", || { black_box(DecapsulationKey::generate(&mut Given(black_box(&seeds))).unwrap()); });
    time("encapsulate", || { let ek = EncapsulationKey::from_bytes(black_box(&pk)).unwrap(); black_box(ek.encapsulate(&mut Given(black_box(&m))).unwrap()); });
    time("keygen+decapsulate", || { let dk = DecapsulationKey::generate(&mut Given(black_box(&seeds))).unwrap(); black_box(dk.decapsulate(black_box(&ct)).unwrap()); });
}
