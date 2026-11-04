# ToyOS #1175 (was #1165), round 8: the AArch64 rows on a quiet host

Masked as round 4's README says. Head `152cae5d1` on main `783569506`.

| file | command | host | result |
|---|---|---|---|
| `r8-arm-wait.log` | the wait for a quiet host: no other qemu, rustc or cargo process and a one-minute load under 4, three checks a minute apart | this Mac | quiet from 14:05, load 2.53 at the start |
| `r8-arm.log` | `test --test toyos-build -- virt_jobs_at_el2 virt_fatal_halts_the_others_first` | this Mac, quiet | exit 0, 2 passed |
