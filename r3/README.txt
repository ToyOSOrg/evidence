PR #918, head abe38d5b3: origin/main 63816ac88 merged (d91ce1c69; conflict in tests/common/claims.rs resolved to main job window with this branch needle) and 4e11ebc10 merged (clean). Neither touches the claim path.
  cargo run -- --ci host ; 0 ; ci-host4.log (77 steps)
  usbd_drives_the_spare  ; 0 ; guest-usbd-spare4.log
  virt_claim_lpi         ; 0 ; guest-virt-claim-lpi4.log
At d91ce1c69 the same three also exited 0.
