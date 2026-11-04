#!/bin/bash
# Negative controls: each mutation applied as a checked patch, built, its
# catching tests run, the exit code recorded, and the mutation reverted.
W=<native worktree>
M=<scratch>/mut
cd $W || exit 1
run() { # name, then "pkg::filter" pairs
  local name=$1; shift
  git apply --check $M/$name.patch || { echo "$name: patch does not apply"; return; }
  git apply $M/$name.patch
  for t in "$@"; do
    pkg=${t%%:*}; filt=${t#*:}
    cargo test --release -p $pkg -- --exact $filt > $M/$name.$pkg.log 2>&1
    echo "$name $pkg $filt exit $?"
  done
  git apply -R $M/$name.patch
  test -z "$(git status --porcelain)" || { echo "tree not clean after $name"; exit 1; }
}
E=engine::tests
run a-silent "bcachefs:$E::a_superblock_place_another_writer_took_refuses_the_volume"
run a-layout "bcachefs:$E::a_superblock_place_another_writer_took_refuses_the_volume" "fileserver:a_native_volume_the_private_format_wrote_over_is_refused_by_name"
run a-front "bcachefs:$E::a_superblock_place_another_writer_took_refuses_the_volume" "fileserver:a_native_volume_the_private_format_wrote_over_is_refused_by_name"
run b-node "bcachefs:$E::metadata_and_data_without_a_checksum_are_refused"
run c-mkfs "bcachefs:$E::mkfs_leaves_nothing_of_another_format_in_the_places_it_reserves"
run c-tail "bcachefs:$E::mkfs_leaves_nothing_of_another_format_in_the_places_it_reserves" "fileserver:the_private_format_s_volume_is_refused_until_designated_then_formatted_clean"
echo "head $(git rev-parse HEAD)"
