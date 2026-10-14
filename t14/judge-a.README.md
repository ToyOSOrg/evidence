# `t14/judge-a.log`, republished

The file published at `516afa638` is empty. My masking script truncated the
local `judge-a.log` (5195 bytes) before publishing: on its first call, the zsh
argument list did not split, and the script opened the judge log as an output
file before failing on its input. So the bytes the orchestrator's judge wrote
are lost.

`judge-a.log` here is the judge's output from `[metal] the tests` to the
verdict, exactly as my session read it with `tail -15` at 01:21:58 run time,
before the truncation. The lines before it are build progress. The two boots'
`verdict.txt` (`passed`, in `t14/`) and the kernel logs beside them carry the
same verdict.

Judging the same readbacks again is no substitute. With the head's judges
(`rejudge-t14-at-head.log`), `usbd_drives_the_type_c_controller` reads red.
#918 changed the hand-over line that judge looks for, while these readbacks
come from a kernel at `3f421a7a8`, which logs `handed over on slot 0`. The
judges at `3f421a7a8` no longer build beside this tree's guest crates, so
they could not be rerun.
