# pr-1150 r14: round 7 judged; user leaves made accessed and dirty; round 8 staged

## Round 7 (`ab7/judgement.txt`)
- **AMD:** the large spawn's copy-out costs 1871-1877 ns a page on head, against main's whole reach,
  pin and copy at 684-685 ns. `fault_in` costs 48 ns a page, and there is 1 copy fault per spawn.
- **T14:** the pad arm reads base's malloc churn (36514/36658 against 36586 kops/s); head reads
  28800. The loss is code placement, recorded as an issue, and the spin stays.

## The fix
`bdec5ab36`: x86-64 user leaves are accessed, and dirty where writable, from creation.

KVM on the guest runner (`kvm/`), base and head interleaved:
- `proc.spawn_wait.large`: 6.95/6.90 ms against main's 7.63/7.61.
- `mem.anon.touch`: 69150/69408 against 116429/117083 ns/MiB.

Checks:
- Host CI at `bdec5ab36`: rc=0, 108 green.
- x86 guest rows (`kvm/guest-rows-42002954748.txt`): 11 of 11.

## Round 8 (`ab8/`)
Rules, set before any boot, request and hashes. Not to boot before bdec5ab36's focused review.
