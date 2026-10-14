PR #918, round 2, head 2a43d55b0: origin/main c4b0e05c0 merged (95027bf34), the
retired-grants issue (a97d4c09f) and the review round 1 fixes (2a43d55b0).
  cargo run -- --build-only                          ; 0 ; build4.log
  cargo run -- --build-only --arch aarch64           ; 0 ; build4-a64.log
  cargo run -- --ci host                             ; 0 ; ci-host2.log (77 steps)
  cargo test --test toyos-build -- usbd_drives_the_spare ; 0 ; guest-usbd-spare2.log
      (also the boot that runs user_dev::install's new assert)
  cargo test --test toyos-build -- virt_claim_lpi        ; 0 ; guest-virt-claim-lpi2.log
Rerun because the merge changed VT-d and SMMU domain code beside the claim
path. Round 1's five-claim boot, its control, the mutation and the T14 run
stand: since 9b39b7ce7, nothing under kernel/src/pcidev, vtd/interrupt.rs,
idt/ or its.rs changed but comments, the install assert and a refusal's text.
