#!/bin/bash
# Each mutation: apply with perl, assert it changed the file, run the crate's tests (expect red), restore with git checkout.
cd <tree> || exit 99
echo "tree $(git rev-parse HEAD) + dirty: $(git status --porcelain --ignore-submodules=all | wc -l)"
run() { # name file perl-expr crate test-filter
  local name=$1 file=$2 expr=$3 crate=$4 filter=$5
  cp "$file" "$file.orig"
  perl -0pi -e "$expr" "$file"
  if cmp -s "$file" "$file.orig"; then echo "[$name] MUTATION DID NOT APPLY"; mv "$file.orig" "$file"; return; fi
  echo "=== [$name] diff"; diff "$file.orig" "$file"
  cargo test -p "$crate" --lib -- "$filter" 2>&1 | grep -E "^test |panicked|test result|^error" | head -20
  echo "[$name] cargo test exit ${PIPESTATUS[0]}"
  mv "$file.orig" "$file"; touch "$file"  # a restored file keeps its old mtime, and cargo would keep the mutated artifact
}
run blockring-reserved lib/blockring/src/entry.rs 's/(\n        let refused = Refused::Malformed \{ tag \};\n        if )reserved/${1}false \&\& reserved/' toyos-blockring a_request_outside_its_bounds
run inflight-seq sdk/transport/src/inflight.rs 's/if tag\.wrapping_shr/if false \&\& tag.wrapping_shr/' toyos-transport inflight
run virtio-written lib/virtio/src/queue.rs 's/if len > chain\.writable/if false \&\& len > chain.writable/' toyos-virtio more_bytes
run virtio-head-narrowed lib/virtio/src/queue.rs 's/usize::try_from\(id\)\.ok\(\)\.filter\(\|&first\| first < self\.slots\.len\(\)\)/usize::try_from(id as u16).ok().filter(|\&first| first < self.slots.len())/' toyos-virtio a_head_past_the_table
run vdagent-port lib/vdagent/src/control.rs 's/if id >= max_nr_ports/if false \&\& id >= max_nr_ports/' toyos-vdagent ""
run vdagent-maxdata lib/vdagent/src/stream.rs 's/filter\(\|&n\| n <= MAX_DATA\)/filter(|\&n| n <= usize::MAX)/' toyos-vdagent ""
git status --porcelain --ignore-submodules=all
