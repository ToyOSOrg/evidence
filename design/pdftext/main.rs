fn main() {
    let a: Vec<String> = std::env::args().collect();
    let mut doc = lopdf::Document::load(&a[1]).unwrap();
    if doc.is_encrypted() { let _ = doc.decrypt(""); }
    let pages: Vec<u32> = doc.get_pages().keys().copied().collect();
    let mut out = String::new();
    for p in pages { out.push_str(&format!("=====PAGE {p}=====\n")); out.push_str(&doc.extract_text(&[p]).unwrap_or_default()); }
    std::fs::write(&a[2], out).unwrap();
}
