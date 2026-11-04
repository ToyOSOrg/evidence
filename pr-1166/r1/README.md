# pr-1166 r1: review r1

- `ns*.log`: the nightly's shape (`--jobs 1`, TOYOS_HOST_CORES=4) over the four 8-vCPU rows and
  libc_children, base (the budget reverted) then head (`nightly-shape.sh`); no CPU wait on either arm.
- `r1-buildlock.log`: the buildlock tests after the probe fix.
- `host-ci.log.gz`: `cargo run -- --ci host` at 69f7f7292, rc=0.
