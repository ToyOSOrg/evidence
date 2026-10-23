/// Scratch only, never committed: writes BB-A9-2's images, built by the
/// committed `an_extent_with_no_checksum_entry_or_the_metadata_type_is_found`'s
/// own helpers, to `$BB_A9_2_OUT`.
#[test]
fn zz_dump_bb_a9_2() {
    let out = std::env::var("BB_A9_2_OUT").unwrap();
    let dev = small();
    std::fs::write(format!("{out}/a9-2-type5.img"), &*dev.get()).unwrap();
    let dev = small();
    rewrite_extents(&dev, type_1);
    std::fs::write(format!("{out}/a9-2-type1.img"), &*dev.get()).unwrap();
    let dev = small();
    rewrite_extents(&dev, no_crc);
    std::fs::write(format!("{out}/a9-2-nocrc.img"), &*dev.get()).unwrap();
}
