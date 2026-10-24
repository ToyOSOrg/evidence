//! Not committed: the metadata-full experiment behind
//! issues/a-bcachefs-mount-of-16-kib-nodes-can-stop-under-churn.md.
use toyos_blockdev::executor::Executor;
use toyos_blockdev::block_on_ready;
use super::mount::{random, MEMORY, NOW, OWNER};
use super::*;

fn full(size: usize) {
    let dev = formatted(size, None);
    let m = block_on_ready(Mount::open(&dev, MEMORY, random())).unwrap();
    let n = Executor::new().block_on(async {
        let mut n = 0;
        let e = loop {
            match m.create(m.root(), format!("f{n}").as_bytes(), New::File, OWNER, NOW).await {
                Ok(_) => n += 1,
                Err(e) => break e,
            }
        };
        eprintln!("EXP size={size} creates={n} refused={e:?}");
        m.commit().await.unwrap();
        for i in 0..20 { m.unlink(m.root(), format!("f{i}").as_bytes(), false, NOW).await.unwrap(); }
        m.commit().await.unwrap();
        n
    }, || panic!("stalled"));
    eprintln!("EXP size={size} after unlinks: {}", &m.dump()[..200]);
    let r = block_on_ready(m.unmount());
    eprintln!("EXP size={size} creates={n} unmount={r:?}");
    if r.is_ok() {
        let v = block_on_ready(Volume::open(&dev)).unwrap();
        eprintln!("EXP size={size} clean seq={}", v.superblock().clean.as_ref().unwrap().journal_seq);
    }
}

#[test]
#[ignore]
fn exp_full_32() { full(32 << 20); }

#[test]
#[ignore]
fn exp_full_64() { full(64 << 20); }
