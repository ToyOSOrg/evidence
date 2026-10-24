const CRC32C_TABLE: [u32; 256] = {
    let mut table = [0u32; 256];
    let mut i = 0u32;
    while i < 256 {
        let mut crc = i;
        let mut j = 0;
        while j < 8 {
            if crc & 1 != 0 {
                crc = (crc >> 1) ^ 0x82F63B78;
            } else {
                crc >>= 1;
            }
            j += 1;
        }
        table[i as usize] = crc;
        i += 1;
    }
    table
};

/// Compute CRC-32c over a byte slice.
pub fn table_crc32c(data: &[u8]) -> u32 {
    table_update(0xFFFF_FFFF, data) ^ 0xFFFF_FFFF
}

/// The same register with no initial or final inversion: bcachefs's data
/// checksum type 5, whose value over zeros is 0.
pub fn table_zero(data: &[u8]) -> u32 {
    table_update(0, data)
}

fn table_update(mut crc: u32, data: &[u8]) -> u32 {
    for &byte in data {
        let idx = ((crc ^ byte as u32) & 0xFF) as usize;
        crc = (crc >> 8) ^ CRC32C_TABLE[idx];
    }
    crc
}

const SLICES: [[u32; 256]; 8] = {
    let mut t = [[0u32; 256]; 8];
    t[0] = CRC32C_TABLE;
    let mut k = 1;
    while k < 8 {
        let mut i = 0;
        while i < 256 {
            let prev = t[k - 1][i];
            t[k][i] = (prev >> 8) ^ CRC32C_TABLE[(prev & 0xFF) as usize];
            i += 1;
        }
        k += 1;
    }
    t
};

fn slice8_update(mut crc: u32, data: &[u8]) -> u32 {
    let (chunks, rest) = data.as_chunks::<8>();
    for c in chunks {
        let lo = crc ^ u32::from_le_bytes([c[0], c[1], c[2], c[3]]);
        crc = SLICES[7][(lo & 0xFF) as usize]
            ^ SLICES[6][((lo >> 8) & 0xFF) as usize]
            ^ SLICES[5][((lo >> 16) & 0xFF) as usize]
            ^ SLICES[4][(lo >> 24) as usize]
            ^ SLICES[3][c[4] as usize]
            ^ SLICES[2][c[5] as usize]
            ^ SLICES[1][c[6] as usize]
            ^ SLICES[0][c[7] as usize];
    }
    for &byte in rest { let idx=((crc ^ byte as u32)&0xFF) as usize; crc=(crc>>8)^CRC32C_TABLE[idx]; }
    crc
}

#[target_feature(enable = "crc")]
unsafe fn hw(mut crc: u32, data: &[u8]) -> u32 {
    use core::arch::aarch64::{__crc32cb, __crc32cd};
    let (w, t) = data.as_chunks::<8>();
    for x in w { crc = __crc32cd(crc, u64::from_le_bytes(*x)); }
    for &b in t { crc = __crc32cb(crc, b); }
    crc
}
fn main() {
    let data: Vec<u8> = (0..4088u32).map(|i| (i * 31 % 251) as u8).collect();
    let a = table_update(!0, &data); let b = slice8_update(!0, &data); let c = unsafe { hw(!0, &data) };
    assert!(a == b && b == c);
    let n = 20000;
    for round in 0..3 {
        for (name, f) in [("table", table_update as fn(u32,&[u8])->u32), ("slice8", slice8_update), ("hw", |c, d| unsafe { hw(c, d) })] {
            let t = std::time::Instant::now();
            let mut x = 0u32;
            for _ in 0..n { x ^= f(std::hint::black_box(x), std::hint::black_box(&data)); }
            std::hint::black_box(x);
            println!("round {round} {name:7} {:>8.0} ns per 4088-byte node", t.elapsed().as_nanos() as f64 / n as f64);
        }
    }
}
