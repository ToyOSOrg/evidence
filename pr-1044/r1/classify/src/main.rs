use curve25519_dalek::{edwards::CompressedEdwardsY, scalar::Scalar, constants::ED25519_BASEPOINT_POINT as B, traits::IsIdentity};
use sha2::{Digest, Sha512};

fn canonical(e: &[u8; 32]) -> bool {
    let p_alias = e[0] >= 0xed && e[1..31].iter().all(|&b| b == 0xff) && e[31] & 0x7f == 0x7f;
    if p_alias { return false; }
    // negative zero: decodes with x = 0 and sign set
    if let Some(pt) = CompressedEdwardsY(*e).decompress() {
        let c = pt.compress().to_bytes();
        return c == *e;
    }
    true
}
fn describe(e: &[u8; 32]) -> String {
    match CompressedEdwardsY(*e).decompress() {
        None => "off-curve".into(),
        Some(p) => {
            let order = if p.is_small_order() { "small" } else if p.is_torsion_free() { "prime" } else { "mixed" };
            format!("{} {}", if canonical(e) { "canonical" } else { "NONCANONICAL" }, order)
        }
    }
}
fn main() {
    if std::env::args().nth(1).as_deref() == Some("probe") { return probe(); }
    let path = std::env::args().nth(1).unwrap();
    let cases: serde_json::Value = serde_json::from_str(&std::fs::read_to_string(path).unwrap()).unwrap();
    for (i, c) in cases.as_array().unwrap().iter().enumerate() {
        let f = |n: &str| hex::decode(c[n].as_str().unwrap()).unwrap();
        let (m, a, sig) = (f("message"), f("pub_key"), f("signature"));
        let a: [u8; 32] = a.try_into().unwrap();
        let r: [u8; 32] = sig[..32].try_into().unwrap();
        let s: [u8; 32] = sig[32..].try_into().unwrap();
        let s_canon = Option::<Scalar>::from(Scalar::from_canonical_bytes(s));
        let s_red = Scalar::from_bytes_mod_order(s);
        let k = Scalar::from_hash(Sha512::new().chain_update(r).chain_update(a).chain_update(&m));
        let (ap, rp) = (CompressedEdwardsY(a).decompress(), CompressedEdwardsY(r).decompress());
        let (mut less, mut cof, mut less_redk, mut cof_redk) = (String::from("-"), String::from("-"), String::from("-"), String::from("-"));
        if let (Some(ap), Some(rp)) = (ap, rp) {
            let d = B * s_red - rp - ap * k;
            less = d.is_identity().to_string();
            cof = d.mul_by_cofactor().is_identity().to_string();
            // k over the reduced (re-encoded) A and R
            let k2 = Scalar::from_hash(Sha512::new().chain_update(rp.compress().as_bytes()).chain_update(ap.compress().as_bytes()).chain_update(&m));
            let d2 = B * s_red - rp - ap * k2;
            less_redk = d2.is_identity().to_string();
            cof_redk = d2.mul_by_cofactor().is_identity().to_string();
        }
        let strict = ed25519_dalek::VerifyingKey::from_bytes(&a).is_ok_and(|key| key.verify_strict(&m, &ed25519_dalek::Signature::from_bytes(&sig[..].try_into().unwrap())).is_ok());
        let ring = ring::signature::UnparsedPublicKey::new(&ring::signature::ED25519, a).verify(&m, &sig).is_ok();
        println!("case {i:2}: A {:22} R {:22} S<L {:5} cofactorless {:5} cofactored {:5} (k over re-encoded: {:5} {:5}) strict {:5} ring {:5}", describe(&a), describe(&r), s_canon.is_some(), less, cof, less_redk, cof_redk, strict, ring);
    }
}

#[allow(dead_code)]
pub fn probe() {
    let mut encodings: Vec<[u8; 32]> = Vec::new();
    for hexs in ["0000000000000000000000000000000000000000000000000000000000000000","0000000000000000000000000000000000000000000000000000000000000080","0100000000000000000000000000000000000000000000000000000000000000","26e8958fc2b227b045c3f489f2ef98f0d5dfac05d3c63339b13802886d53fc05","26e8958fc2b227b045c3f489f2ef98f0d5dfac05d3c63339b13802886d53fc85","c7176a703d4dd84fba3c0b760d10670f2a2053fa2c39ccc64ec7fd7792ac037a","c7176a703d4dd84fba3c0b760d10670f2a2053fa2c39ccc64ec7fd7792ac03fa","ecffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff7f",
      "0100000000000000000000000000000000000000000000000000000000000080","ecffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff","edffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff7f","edffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff","eeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff7f","eeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff"] {
        encodings.push(hex::decode(hexs).unwrap().try_into().unwrap());
    }
    let s = Scalar::from_bytes_mod_order([5; 32]);
    let r = (B * s).compress().to_bytes();
    for a in &encodings {
        let mut n = 0u32;
        let m = loop {
            let m = n.to_le_bytes();
            let k = Scalar::from_hash(Sha512::new().chain_update(r).chain_update(a).chain_update(m));
            if k.as_bytes()[0] % 8 == 0 { break m; }
            n += 1;
        };
        let mut sig = [0u8; 64]; sig[..32].copy_from_slice(&r); sig[32..].copy_from_slice(s.as_bytes());
        let dk = ed25519_dalek::VerifyingKey::from_bytes(a);
        let strict = dk.as_ref().is_ok_and(|key| key.verify_strict(&m, &ed25519_dalek::Signature::from_bytes(&sig)).is_ok());
        let lax = dk.as_ref().is_ok_and(|key| ed25519_dalek::Verifier::verify(key, &m, &ed25519_dalek::Signature::from_bytes(&sig)).is_ok());
        let ring = ring::signature::UnparsedPublicKey::new(&ring::signature::ED25519, a).verify(&m, &sig).is_ok();
        println!("{} {:22} n={n} dalek-decodes {} strict {strict} dalek-verify {lax} ring {ring}", hex::encode(a), describe(a), dk.is_ok());
    }
    // non-canonical, non-small A: y = p + k
    for k in 0..19u8 { for sign in [0u8, 0x80] {
        let mut a = [0xffu8; 32]; a[0] = 0xed + k; a[31] = 0x7f | sign;
        let dk = ed25519_dalek::VerifyingKey::from_bytes(&a);
        println!("y=p+{k:2} sign {sign:3}: {:22} dalek-decodes {} weak {:?}", describe(&a), dk.is_ok(), dk.as_ref().map(|k| k.is_weak()).ok());
    }}
}
