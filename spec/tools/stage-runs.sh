#!/bin/bash
# Masks the demo's run logs the specification cites into the evidence clone, whole.
# argv: <survey dir> <evidence spec/runs dir> <mask.sh>
set -u
S=$1 E=$2 M=$3
mkdir -p "$E"
mask() { bash "$M" | sed -E 's/[Yy][Oo][Gg][Aa]/<bench>/g; s/build [0-9a-f]{40}/build <demo build>/g'; }
while read -r src dst; do
	mask < "$S/$src" > "$E/$dst"
	echo "$dst: mask exit ${PIPESTATUS[0]}, $(wc -l < "$E/$dst") lines"
done <<'EOF'
<bench>-boot12-v11/2026-10-10-135842.log demo-v11.log
<bench>-boot16-v13b/kernel.log demo-v13.log
<bench>-run-20261010T231117/kernel.log demo-v14.log
<bench>-run-20261010T231741/kernel.log demo-v15.log
<bench>-run-20261010T233128/kernel.log demo-v16.log
EOF
echo "identifier counts:"
grep -c -i -E '<vendor>|<model>|<bios>|<model>|<host>|<bios>|<bench>' "$E"/*.log
