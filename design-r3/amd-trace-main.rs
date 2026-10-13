//! Every access the AMD bench's tables make for the controller's _REG(3, 1)
//! and the adapter's _PSR, under a model host: memory reads answer `fill` in
//! every byte but the root complex's mailbox, the embedded controller's reads
//! answer `ec`, every write is accepted and printed.
use toyos_acpi::{Phys, Table};
use toyos_aml::*;
#[derive(Clone, Copy)]
struct Image<'a>(&'a [u8]);
impl Phys for Image<'_> {
    fn readable(self, p: u64, l: usize) -> bool { (p as usize + l) <= self.0.len() }
    fn byte(self, p: u64) -> u8 { self.0[p as usize] }
}
const ECAM: u64 = 0xF800_0000;
const RESPONSE: u64 = 0x03B1_0564;
const MESSAGE: u64 = 0x03B1_0528;
struct H { fill: u8, ec: u8, bank: u64, pending: bool }
fn mask(w: Access) -> u64 { match w { Access::Byte => 0xFF, Access::Word => 0xFFFF, Access::DWord => 0xFFFF_FFFF, Access::QWord => u64::MAX } }
fn ecam(a: u64) -> String {
    if (ECAM..ECAM + 0x400_0000).contains(&a) { let o = a - ECAM; format!(" [ECAM {:02x}:{:02x}.{} +{:#x}]", o >> 20, (o >> 15) & 0x1F, (o >> 12) & 7, o & 0xFFF) } else { String::new() }
}
impl Host for H {
    fn read(&mut self, at: Address, w: Access) -> Result<u64, Denied> {
        let v = match at {
            Address::Memory(a) if a == ECAM + 0xBC && self.bank == RESPONSE => u64::from(self.pending),
            Address::Memory(a) if a == ECAM + 0xB8 => self.bank,
            Address::Memory(_) => u64::from_le_bytes([self.fill; 8]) & mask(w),
            Address::EmbeddedControl(_) => u64::from(self.ec),
            _ => 0,
        };
        let tag = if let Address::Memory(a) = at { ecam(a) } else { String::new() };
        println!("R {at:x?} {w:?} -> {v:#x}{tag}");
        Ok(v)
    }
    fn write(&mut self, at: Address, w: Access, v: u64) -> Result<(), Denied> {
        let tag = if let Address::Memory(a) = at { ecam(a) } else { String::new() };
        println!("W {at:x?} {w:?} <- {v:#x}{tag}");
        match at {
            Address::Memory(a) if a == ECAM + 0xB8 => self.bank = v,
            Address::Memory(a) if a == ECAM + 0xBC && self.bank == RESPONSE => self.pending = false,
            Address::Memory(a) if a == ECAM + 0xBC && self.bank == MESSAGE => self.pending = true,
            _ => {}
        }
        Ok(())
    }
    fn sleep(&mut self, ms: u64) { println!("sleep {ms}"); }
    fn stall(&mut self, us: u64) { println!("stall {us}"); }
    fn timer(&mut self) -> u64 { 0 }
    fn notify(&mut self, o: &str, v: u64) { println!("notify {o} {v:#x}"); }
    fn global_take(&mut self) -> Result<(), Denied> { Ok(()) }
    fn global_take_within(&mut self, _: u16) -> Result<bool, Denied> { Ok(true) }
    fn global_release(&mut self) -> Result<(), Denied> { Ok(()) }
    fn table(&mut self, at: u64, _: usize) -> Result<Vec<u8>, Denied> { Err(Denied(format!("table {at:x}"))) }
    fn loaded(&mut self, _: &RuntimeLoad<'_>) {}
    fn transfer(&mut self, _: &Transfer<'_>, _: Option<&[u8]>) -> Result<Vec<u8>, Denied> { Err(Denied("transfer".into())) }
    fn find_table(&mut self, _: &[u8], _: &[u8], _: &[u8]) -> Result<Option<(u64, usize)>, Denied> { Ok(None) }
}
fn main() {
    let args: Vec<String> = std::env::args().collect();
    let dir = &args[1];
    let fill = u8::from_str_radix(&args[2], 16).unwrap();
    let ec = u8::from_str_radix(&args[3], 16).unwrap();
    let mut h = H { fill, ec, bank: 0, pending: false };
    let mut i = Interpreter::new();
    let mut names = vec!["DSDT".to_string()];
    for n in 1..=16 { names.push(format!("SSDT{n}")); }
    for n in names {
        let b = std::fs::read(format!("{dir}/tables/{n}")).unwrap();
        let sig: [u8; 4] = b[..4].try_into().unwrap();
        let t = Table::open(Image(&b), 0, &sig, 0).unwrap();
        println!("load {n}: {:?}", i.load(&mut h, &t));
    }
    println!("== _REG(3, 1)");
    println!("=> {:?}", i.evaluate(&mut h, "\\_SB_.PCI0.LPC0.EC__._REG", &[Value::Integer(3), Value::Integer(1)]));
    println!("== _PSR");
    println!("=> {:?}", i.evaluate(&mut h, "\\_SB_.ACAD._PSR", &[]));
}
