#!/bin/sh
cd <path> || exit 2
P=<path>
echo "HEAD $(git rev-parse HEAD)"
git apply --check $P && git apply $P || exit 3
cargo test -p toyos-userbound --test firmware the_8259s_edge_level_control_is_refused_though_nothing_declares_it; echo "EXIT(m-elcr-passes)=$?"
git apply -R $P
git status --porcelain --ignore-submodules=none; echo "tree clean above"
