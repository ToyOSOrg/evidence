// The chain's reading in process_tree.rs at ff1a11dbd (`old`) and after the fix (`new`),
// fed the lines link() prints for a chain of 62 links whose 63rd spawn is refused.
fn lines() -> Vec<String> {
    let mut v: Vec<String> = (1..=62).map(|k| format!("link {k}")).collect();
    v.push("link 62: its next link was refused: permission denied".to_string());
    v
}
fn old() -> (u32, String) {
    let mut started = 0;
    for line in lines() {
        if let Some(k) = line.strip_prefix("link ") {
            started = k.parse().expect("a link's index");
        } else if line.starts_with("unbounded") {
            panic!("unbounded");
        } else if line.contains("refused") {
            return (started, line);
        }
    }
    panic!("the chain ended without a refusal")
}
fn new() -> (u32, String) {
    let mut started = 0;
    for line in lines() {
        if line.contains("refused") {
            return (started, line);
        } else if line.starts_with("unbounded") {
            panic!("unbounded");
        } else if let Some(k) = line.strip_prefix("link ") {
            started = k.parse().expect("a link's index");
        }
    }
    panic!("the chain ended without a refusal")
}
fn main() {
    match std::env::args().nth(1).as_deref() {
        Some("old") => println!("{:?}", old()),
        Some("new") => println!("{:?}", new()),
        _ => panic!("old or new"),
    }
}
