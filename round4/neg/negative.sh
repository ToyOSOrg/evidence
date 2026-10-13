#!/bin/sh
# The round's production sources reverted onto its base d94ed4cb9, under this head's tests.
cd <path> || exit 2
FILES="lib/userbound/src/firmware.rs lib/acpiserver-api/src/lib.rs system/acpiserver/src/battery.rs system/acpiserver/src/host.rs system/acpiserver/src/init.rs system/acpiserver/aml/src/exec.rs system/acpiserver/aml/src/lib.rs"
echo "HEAD $(git rev-parse HEAD); reverted to d94ed4cb9: $FILES"
git diff --stat d94ed4cb9 HEAD -- $FILES
git checkout d94ed4cb9 -- $FILES
cargo test -p toyos-userbound -p toyos-aml; echo "EXIT(userbound, aml)=$?"
cargo test --manifest-path system/acpiserver/Cargo.toml; echo "EXIT(acpiserver)=$?"
git checkout HEAD -- $FILES
git status --porcelain --ignore-submodules=none; echo "tree clean above"
