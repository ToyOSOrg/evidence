# Parent-workspace integration check

Primitive/provider source: 3985c25568194d0ccf4c042bf029a7092b20ff01.
Reproduce from the crate checkout with `python3 tools/check_workspace.py`.

An isolated copy is placed at lib/crypto in a new parent Cargo workspace, with
an independent no_std consumer that imports it by path. The workspace has no
Git metadata, and CARGO_TARGET_DIR points outside the workspace. Cargo resolves
from cached packages offline, then checks default core and optional rustls
provider with a locked parent-workspace lockfile. Both pass. Normal dependency
trees show no core dependencies and no ring/aws-lc in the provider build.

Every fixture hash in NOTICE is checked against the actual file. Each table
entry now carries its licence/notice explicitly, and the introductory dependency
statement distinguishes the dependency-free core from optional rustls.
The temporary workspace and build directory are removed. No ToyOS repository
was read or changed. This checks generic Cargo integration, not ToyOS's custom
target, boot/runtime, linker configuration or integration PR.
