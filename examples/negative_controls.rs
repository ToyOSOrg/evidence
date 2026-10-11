//! Mutates one boundary at a time and records a failing host test and its patch.
//! Run only in an isolated, clean copy of this crate; source is restored after
//! each child process. Interrupting the runner can leave that copy mutated.
use std::{fs, path::Path, process::Command};
fn main() {
    let root = Path::new(env!("CARGO_MANIFEST_DIR"));
    let logs = root.join("evidence/mutations");
    fs::create_dir_all(&logs).unwrap();
    let cases = [
        (
            "tag",
            "src/aead.rs",
            "if !crate::ct::equal(&chacha_tag(key, nonce, aad, data), tag)",
            "if false",
            "rfc8439_aead_and_authenticated_refusal",
        ),
        (
            "point",
            "src/nist.rs",
            "if self.p.square(&y).eq(&rhs) != 1",
            "if false",
            "malformed_public_boundaries",
        ),
        (
            "scalar",
            "src/ed25519.rs",
            "let s = S::canonical(s_bytes).ok_or(Error::InvalidSignature)?;",
            "let s = S::reduce(s_bytes);",
            "rfc8032_empty_and_strict_rejection",
        ),
        (
            "length",
            "src/ed25519.rs",
            "if signature.len() != 64",
            "if false",
            "rfc8032_empty_and_strict_rejection",
        ),
        (
            "small_order",
            "src/ed25519.rs",
            "if point.small_order()",
            "if false",
            "rfc8032_empty_and_strict_rejection",
        ),
        (
            "kem_modulus",
            "src/mlkem.rs",
            "if p.0.iter().any(|&x| u32::from(x) >= Q)",
            "if false",
            "malformed_public_boundaries",
        ),
    ];
    let mut baseline = Command::new(std::env::var_os("CARGO").unwrap_or_else(|| "cargo".into()));
    baseline.current_dir(root).args([
        "test",
        "--release",
        "--features",
        "std,sign,wpa2",
        "--test",
        "vectors",
    ]);
    let baseline = baseline.output().unwrap();
    fs::write(
        logs.join("baseline.log"),
        [baseline.stdout, baseline.stderr].concat(),
    )
    .unwrap();
    assert!(baseline.status.success(), "baseline must pass");
    for (name, file, old, new, test) in cases {
        let path = root.join(file);
        let original = fs::read_to_string(&path).unwrap();
        assert_eq!(original.matches(old).count(), 1, "mutation anchor {name}");
        let modified = original.replacen(old, new, 1);
        let line = original[..original.find(old).unwrap()]
            .bytes()
            .filter(|&b| b == b'\n')
            .count()
            + 1;
        let patch = format!(
            "--- a/{file}\n+++ b/{file}\n@@ -{line},1 +{line},1 @@\n-{}\n+{}\n",
            original.lines().nth(line - 1).unwrap(),
            modified.lines().nth(line - 1).unwrap()
        );
        fs::write(logs.join(format!("{name}.patch")), patch).unwrap();
        fs::write(&path, modified).unwrap();
        let output = Command::new(std::env::var_os("CARGO").unwrap_or_else(|| "cargo".into()))
            .current_dir(root)
            .args([
                "test",
                "--release",
                "--features",
                "std,sign,wpa2",
                "--test",
                "vectors",
                test,
                "--",
                "--exact",
            ])
            .output();
        fs::write(&path, original).unwrap();
        let output = output.unwrap();
        let exit = output.status.code().unwrap_or(-1);
        let text = [output.stdout, output.stderr].concat();
        let content = String::from_utf8_lossy(&text);
        fs::write(logs.join(format!("{name}.log")), &text).unwrap();
        fs::write(logs.join(format!("{name}.exit")), format!("{exit}\n")).unwrap();
        assert_eq!(exit, 101, "mutation must fail {name}");
        assert!(
            content.contains("test result: FAILED"),
            "compiler failure is not a negative control {name}"
        );
        println!("{name}: {test} exit {exit}");
    }
}
