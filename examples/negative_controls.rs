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
            "if !crate::ct::equal(&expected.0, tag)",
            "if false",
            "vectors",
            "rfc8439_aead_and_authenticated_refusal",
        ),
        (
            "point",
            "src/nist.rs",
            "if self.p.square(&y).eq(&rhs) != 1",
            "if false",
            "vectors",
            "malformed_public_boundaries",
        ),
        (
            "scalar",
            "src/ed25519.rs",
            "let s = S::canonical(s_bytes).ok_or(Error::InvalidSignature)?;",
            "let s = S::reduce(s_bytes);",
            "vectors",
            "rfc8032_empty_and_strict_rejection",
        ),
        (
            "length",
            "src/ed25519.rs",
            "if signature.len() != 64",
            "if false",
            "vectors",
            "rfc8032_empty_and_strict_rejection",
        ),
        (
            "small_order",
            "src/ed25519.rs",
            "if point.small_order()",
            "if false",
            "vectors",
            "rfc8032_empty_and_strict_rejection",
        ),
        (
            "kem_modulus",
            "src/mlkem.rs",
            "if p.0.iter().any(|&x| u32::from(x) >= Q)",
            "if false",
            "vectors",
            "malformed_public_boundaries",
        ),
        (
            "gcm_tag",
            "src/gcm.rs",
            "if !crate::ct::equal(&expected.0, tag)",
            "if false",
            "differential",
            "aead_all_algorithms_and_partial_blocks",
        ),
        (
            "aes_counter",
            "src/arch/aarch64.rs",
            "let counter = i as u32 * 4 + 2;",
            "let counter = i as u32 * 4 + 3;",
            "differential",
            "aead_all_algorithms_and_partial_blocks",
        ),
        (
            "ghash_power",
            "src/arch/aarch64.rs",
            "let h4 = multiply_vector(h2, h2);",
            "let h4 = multiply_vector(h2, h);",
            "lib",
            "gcm::tests::accelerated_ghash_preserves_polynomial_basis_and_stream_recurrence",
        ),
        (
            "x86_aes_counter",
            "src/arch/x86_64.rs",
            "let counter = i as u32 * 4 + 2;",
            "let counter = i as u32 * 4 + 3;",
            "differential",
            "aead_all_algorithms_and_partial_blocks",
        ),
        (
            "x86_ghash_power",
            "src/arch/x86_64.rs",
            "let h4 = multiply_vectors(h2, h2);",
            "let h4 = multiply_vectors(h2, h);",
            "lib",
            "gcm::tests::accelerated_ghash_preserves_polynomial_basis_and_stream_recurrence",
        ),
        (
            "provider_sequence",
            "src/rustls_provider/cipher.rs",
            "if seq != self.next || seq == u64::MAX",
            "if seq == u64::MAX",
            "lib",
            "rustls_provider::tests::record_adapters_interoperate_and_refuse_reused_sequences",
        ),
        (
            "provider_der_integer",
            "src/rustls_provider/verify.rs",
            "if value.len() < 2 || value[1] & 128 == 0",
            "if value.len() < 2",
            "lib",
            "rustls_provider::verify::tests::rsa_der_refuses_noncanonical_integers_lengths_and_trailing_bytes",
        ),
        (
            "provider_der_length",
            "src/rustls_provider/verify.rs",
            "if len < 128",
            "if false",
            "lib",
            "rustls_provider::verify::tests::rsa_der_refuses_noncanonical_integers_lengths_and_trailing_bytes",
        ),
    ];
    let features = if cfg!(feature = "rustls-provider") {
        "std,sign,wpa2,rustls-provider"
    } else {
        "std,sign,wpa2"
    };
    let mut baseline = Command::new(std::env::var_os("CARGO").unwrap_or_else(|| "cargo".into()));
    baseline
        .current_dir(root)
        .args(["test", "--release", "--features", features]);
    let baseline = baseline.output().unwrap();
    fs::write(
        logs.join("baseline.log"),
        [baseline.stdout, baseline.stderr].concat(),
    )
    .unwrap();
    assert!(baseline.status.success(), "baseline must pass");
    for (name, file, old, new, suite, test) in cases {
        if name.starts_with("provider_") && !cfg!(feature = "rustls-provider") {
            println!("{name}: requires rustls-provider; skipped");
            continue;
        }

        if matches!(name, "aes_counter" | "ghash_power") && std::env::consts::ARCH != "aarch64" {
            println!("{name}: requires native ARM64; skipped");
            continue;
        }
        if name.starts_with("x86_") && std::env::consts::ARCH != "x86_64" {
            println!("{name}: requires native x86-64; skipped");
            continue;
        }
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
        let mut command = Command::new(std::env::var_os("CARGO").unwrap_or_else(|| "cargo".into()));
        command
            .current_dir(root)
            .args(["test", "--release", "--features", features]);
        if suite == "lib" {
            command.arg("--lib");
        } else {
            command.args(["--test", suite]);
        }
        let output = command.args([test, "--", "--exact"]).output();
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
