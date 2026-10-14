//! One AArch64 compile of `i219_msi`, through the build crate's own guest path.
use std::path::Path;
use toyos_build::arch::Arch;

fn main() {
    let root = Path::new("$HOME/Dev/jan/toyos-i219-msi");
    let bytes = toyos_build::build::build_toyos_bin(root, Arch::Aarch64, &root.join("tests/guest/rust-tests"), "i219_msi", false);
    println!("i219_msi for aarch64: {} bytes", bytes.len());
}
