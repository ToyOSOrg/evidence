fn main() {
    let which = std::env::args().nth(1).unwrap();
    let mut x: u64 = 3;
    let mut y: u64 = 5;
    unsafe {
        match which.as_str() {
            "mulx" => core::arch::asm!("mov rdx, {0}", "mulx {1}, {0}, {1}", inout(reg) x, inout(reg) y, out("rdx") _),
            "adcx" => core::arch::asm!("adcx {0}, {1}", inout(reg) x, in(reg) y),
            "adox" => core::arch::asm!("adox {0}, {1}", inout(reg) x, in(reg) y),
            _ => {}
        }
    }
    println!("{which} ok {x} {y}");
}
