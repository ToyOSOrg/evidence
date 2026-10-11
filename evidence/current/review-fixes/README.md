# Automated review fixes and target scope

Reports A/B/C reviewed `2af52e453b1cdc13fc58548c3a76115ebdc694e2`. They are
Claude model reviews, not external audits. Their extra probes are described
in the reports; full probe outputs were not supplied, so those descriptions
are not additional independently reproduced acceptance gates.

The final consumer scope is UEFI loader and userland. The kernel is not a
consumer. Bare-metal x86 and soft-float ARM kernel targets fail with a clear
compile-time diagnostic. SIMD implementations are excluded on their unsupported
ABIs; no warning suppression or intrinsic-on-softfloat workaround is used.

| Finding | Disposition |
| --- | --- |
| Bare-metal LLVM crash / soft-float NEON ABI warning | Both reproduced, then replaced with explicit unsupported-target refusal; 12 debug/release/feature combinations checked with warnings denied. |
| AArch64 no_std admission | Added unsafe OS-capability metadata bridge without an ID-register read. OS startup integration and actual capability acquisition remain with ToyOS. |
| Explicit ChaCha Copy state | Initialize a borrowed word workspace; original and round workspace have Drop wipes. |
| Computed GCM/ChaCha/SSH opening tags | Secret owners erase expected tags on success and failure. Public sealing tags remain returned to callers. |
| Prior expanded-key moves | Still open. Owned-storage wiping does not erase earlier moves, compiler copies/spills or registers. The report identifies concrete provider stack copies. |
| Arithmetic modulus assumption | Constructor now requires four/six limbs, odd modulus and high bit set; one-subtract raw digest reduction cannot silently extend to a smaller modulus. V representations remain untyped. |
| ECDH Wycheproof inventory | Open; current point decoder and differential probes do not replace the missing official fixtures. |
| Ed25519 cofactorless policy | Retained documented strict verification policy. |
| Local oversized outbound TLS record | Return EncryptError instead of blaming the peer. Upstream protocol size/sequence/record-limit invariants still make sealer refusals unreachable in normal rustls operation. |
| RNG source quality | Caller OS responsibility; read errors propagate. Sample health checks cannot certify cryptographic entropy. |
| Hybrid classical component | Additional classical key share optimization remains open; current fallback uses HelloRetryRequest. |
| RSA above 4096 bits | Outside the named 2048–4096 consumer bound; no expansion claimed. |
| TLS 1.2 policy | Owner retained the existing six ECDHE+AEAD suites. |

`review-target-final.log`: 12 expected compile refusals, each exit 101 with
clear scope diagnostic, no LLVM crash or softfloat NEON warning. It then builds
supported x86/AArch64 UEFI, x86 Linux and Windows MSVC provider libraries with
warnings denied, exit 0 each. These are compile checks, not firmware/OS runtime.
`review-arm-uefi-final.log` repeats the ARM UEFI build after the metadata API.
`review-final-host-gates.log`: dispatched and portable ARM release suites,
46 tests each; clippy for both configurations; Rust 1.89 check; formatting, all
exit 0. `review-mutations.log` and `mutations/`: final isolated source baseline
passes, 12 mutants exit 101 with failed tests, runner exit 0. All source files
were restored and checked against the final source. Mutation anchors follow
the new owned tag variables.

The before/prototype/first logs are retained historical attempts. The initial
portable bare-metal matrix and SIMD-operand assembly scan succeeded, before the
owner clarified kernel exclusion. They are not supported-target qualification.
The first lint attempt rejected an indexed loop; the final iterator passes.

Native x86 correctness revalidation after these changes passed on both hosts:
r0013/r0014 at `2f2625696403b1eb0bd9048d3cd11c4da586ea2e`, 46 tests each,
exit 0, GHASH acceleration admitted. Full logs are in the parent directory. Initial and
focused timing in the parent directory were obtained before these wiping and
modulus checks and do not qualify the current source. Independent external
review, complete official corpora and deployment gates remain open.
