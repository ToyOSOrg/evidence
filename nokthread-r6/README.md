# ToyOS #1165, round 6: review r2's fixes, rebased onto main `783569506`

Masked as round 4's README says. Head `d4c43fd35`.

| file | command | host | result |
|---|---|---|---|
| `r6-build-x86.log`, `r6-build-arm.log` | `run -- --build-only`, `--arch aarch64` | this Mac | exit 0, 0 |
| `r6-ci-host.log` | `run -- --ci host` | this Mac | exit 0, 108 green (the loom `error:` lines are its negative controls, red as they should be) |
| `r6-remote-x86.log` | `test --test toyos-build -- a_supervisor_that_fails_early_says_why_on_the_uart` | x86 guest host | exit 0, 1 passed; the supervisor's last words through `Rights::LAST_WORDS` |
