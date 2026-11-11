# Round 2, ToyOS head f06faad8acfe607ee3ffed9e1f6d70c42057c3f7 on main 6d4b7e4ce

Review r1's fixes, the branch rebased past #1211, #1238 and #1131.

## Host checks (`host/`), on the development Mac at f06faad8a, clean tree (`host/rev.txt`)
`host/checks.sh` is the script; `host/summary.txt` lists each command and its exit code.
- clippy: kernel x86_64 and aarch64 (default, boot+test actuators, boot actuators, instruments), kernel library
  (sched-check; kernel controls), kernel-loom (default; tlb-tags controls): exit 0 each.
- `cargo test -p kernel --lib sched::`: exit 0, 197 passed.
- loom `tlb_tags`: exit 0. Controls: `tlb-tags-resume-relaxed` exit 101, only the idle holder's model fails;
  `tlb-tags-enter-relaxed` exit 101, only the entering model fails.

## AMD APM (`apm-fetch.log`)
Vol. 3 (24594) could not be fetched: amd.com ends the stream (curl exit 92) for the build's user agent at both
known paths. Not read by this agent.

## Metal staging (`stage/`)
`tools/stage-r2.sh` staged from one clean worktree: the head's boot:testcases boot:shared-debug boot:benchcase
(4 images with testcases-watchdog); two FPU mutants (`patches/`), each applied, staged with only vector_state,
reverted, the tree clean again; base 6d4b7e4ce's boot:benchcase. `head-vector.log` stages the head with only
vector_state, as the mutants are, for comparison. Each staging exits 2 ("staged, nothing established").
`slotfiles.txt` (`tools/slotfiles.py`, the files of each image's slot A volume): head kernel.img 16fe0c106892 in
both head testcases images; mutant-left 7804eaeb19a1 and mutant-holder 288826b488ac differ from it, so each
mutation is compiled in; base benchcase c6c69b2f7a9c against head benchcase 133acab18b15.
`request.txt`: the run request (verdict boots on both benches, both mutants on the T14, the A/B in the order
B H H B H B B H on both benches).
