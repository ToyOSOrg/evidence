use toyos_acpi::{Phys, Table};
use toyos_aml::*;
#[derive(Clone, Copy)]
struct Image<'a>(&'a [u8]);
impl Phys for Image<'_> {
    fn readable(self, p: u64, l: usize) -> bool { (p as usize + l) <= self.0.len() }
    fn byte(self, p: u64) -> u8 { self.0[p as usize] }
}
struct H { nvs: Vec<u8>, base: u64 }
impl Host for H {
    fn read(&mut self, at: Address, w: Access) -> Result<u64, Denied> {
        let n = match w { Access::Byte => 1, Access::Word => 2, Access::DWord => 4, Access::QWord => 8 };
        let v = match at {
            Address::Memory(a) if (0x949b8fd8..0x949b8ff0).contains(&a) => u64::from_le_bytes([0x10; 8]) & (if n == 8 { u64::MAX } else { (1u64 << (8 * n)) - 1 }),
            Address::Memory(a) if a >= self.base && a + n < self.base + self.nvs.len() as u64 => {
                let o = (a - self.base) as usize; let mut b = [0u8; 8]; b[..n as usize].copy_from_slice(&self.nvs[o..o + n as usize]); u64::from_le_bytes(b)
            }
            Address::PciConfig { device: 0, function: 0, offset: 0x48, .. } => 0xfedc0001,
            Address::PciConfig { device: 0, function: 0, offset: 0x60, .. } => 0xc0000001,
            _ => 0,
        };
        let nvs = matches!(at, Address::Memory(a) if a >= self.base && a < self.base + self.nvs.len() as u64);
        if !nvs { println!("R {at:x?} {w:?} -> {v:#x}"); }
        Ok(v)
    }
    fn write(&mut self, at: Address, w: Access, v: u64) -> Result<(), Denied> {
        println!("W {at:x?} {w:?} <- {v:#x}");
        let n = match w { Access::Byte => 1, Access::Word => 2, Access::DWord => 4, Access::QWord => 8 };
        if let Address::Memory(a) = at { if a >= self.base && a + n <= self.base + self.nvs.len() as u64 && !(0x949b8fd8..0x949b8ff0).contains(&a) { let o = (a - self.base) as usize; self.nvs[o..o + n as usize].copy_from_slice(&v.to_le_bytes()[..n as usize]); } }
        Ok(())
    }
    fn sleep(&mut self, ms: u64) { println!("sleep {ms}"); }
    fn stall(&mut self, us: u64) { println!("stall {us}"); }
    fn timer(&mut self) -> u64 { 0 }
    fn notify(&mut self, o: &str, v: u64) { println!("notify {o} {v}"); }
    fn global_take(&mut self) -> Result<(), Denied> { Ok(()) }
    fn global_take_within(&mut self, _: u16) -> Result<bool, Denied> { Ok(true) }
    fn global_release(&mut self) -> Result<(), Denied> { Ok(()) }
    fn table(&mut self, at: u64, _: usize) -> Result<Vec<u8>, Denied> { Err(Denied(format!("table {at:x}"))) }
    fn loaded(&mut self, _: &RuntimeLoad<'_>) {}
    fn transfer(&mut self, _: &Transfer<'_>, _: Option<&[u8]>) -> Result<Vec<u8>, Denied> { Err(Denied("transfer".into())) }
    fn find_table(&mut self, _: &[u8], _: &[u8], _: &[u8]) -> Result<Option<(u64, usize)>, Denied> { Ok(None) }
}
fn main() {
    let dir = std::env::args().nth(1).unwrap();
    let path = std::env::args().nth(2).unwrap();
    let mut h = H { nvs: std::fs::read(format!("{dir}/nvs/0x93f2f000.bin")).unwrap(), base: 0x93f2f000 };
    let mut i = Interpreter::new();
    let mut names = vec!["DSDT".to_string()];
    for n in 1..=13 { names.push(format!("SSDT{n}")); }
    for n in names {
        let b = std::fs::read(format!("{dir}/tables/{n}")).unwrap();
        let sig: [u8; 4] = b[..4].try_into().unwrap();
        let t = Table::open(Image(&b), 0, &sig, 0).unwrap();
        println!("load {n}: {:?}", i.load(&mut h, &t));
    }
    for p in path.split(",") { println!("== {p}"); println!("=> {:?}", i.evaluate(&mut h, p, &[])); }
}
