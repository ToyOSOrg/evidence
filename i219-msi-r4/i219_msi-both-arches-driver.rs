//! One compile of `i219_msi` for each architecture, through the build crate's own guest path.
use std::path::Path;
use toyos_build::arch::Arch;

fn main() {
    let root = Path::new("$HOME/Dev/jan/toyos-i219-msi");
    for arch in Arch::ALL {
        let bytes = toyos_build::build::build_toyos_bin(root, arch, &root.join("tests/guest/rust-tests"), "i219_msi", false);
        println!("i219_msi for {}: {} bytes", arch.name(), bytes.len());
    }
}
