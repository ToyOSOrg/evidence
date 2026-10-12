// Scratch, never committed: replay every corpus trace and say what it does now.
use kernel_sim::scenarios;
use kernel_sim::shrink;
#[test]
fn corpus() {
    let dir = concat!(env!("CARGO_MANIFEST_DIR"), "/corpus");
    for entry in std::fs::read_dir(dir).unwrap() {
        let path = entry.unwrap().path();
        let text = std::fs::read_to_string(&path).unwrap();
        let e = shrink::decode(&text);
        let o = shrink::replay(&e, scenarios::by_name(&e.scenario).unwrap());
        println!("zz {}: expect_fail={} got passed={} {:?}", path.display(), e.expect_failure, o.passed(), o.violations);
    }
}
