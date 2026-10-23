//! Writes B2's volumes for the upstream judge, and corrupted copies of them
//! as the judge's control on ToyOS's own bytes. Seeded, so reproducible.
use bcachefs::engine::{mkfs, Encryption, Options, MIN_KDF};
use toyos_blockdev::{block_on_ready, Bytes};
use toyos_crypto::Random;

struct Seeded(u64);
impl Random for Seeded {
    fn fill(&mut self, out: &mut [u8]) -> Result<(), toyos_crypto::Error> {
        for b in out {
            self.0 ^= self.0 << 13;
            self.0 ^= self.0 >> 7;
            self.0 ^= self.0 << 17;
            *b = (self.0.wrapping_mul(0x2545_f491_4f6c_dd1d) >> 56) as u8;
        }
        Ok(())
    }
}

fn main() {
    let out = std::env::args().nth(1).expect("output directory");
    let secret: Vec<u8> = (0u8..32).flat_map(|b| format!("{b:02x}").into_bytes()).collect();
    std::fs::write(format!("{out}/pass"), [secret.as_slice(), b"\n"].concat()).unwrap();
    let time = 1_761_177_600_000_000_000; // 2025-10-23T00:00:00Z
    for (name, size, enc, seed) in [
        ("root-32m", 32u64 << 20, false, 1u64),
        ("root-1g", 1 << 30, false, 2),
        ("data-64m", 64 << 20, true, 3),
        ("data-1g", 1 << 30, true, 4),
    ] {
        let dev = Bytes::new(vec![0u8; size as usize]);
        let encryption = enc.then(|| Encryption { passphrase: &secret, kdf: MIN_KDF });
        let options = Options { label: name.as_bytes(), time, encryption };
        block_on_ready(mkfs(&dev, &options, &mut Seeded(seed))).unwrap();
        std::fs::write(format!("{out}/{name}.img"), &*dev.get()).unwrap();
        println!("{name}.img {size} bytes, seed {seed}, encrypted {enc}");
    }
}
