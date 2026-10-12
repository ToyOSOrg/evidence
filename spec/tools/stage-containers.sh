#!/bin/bash
# Writes the container read-outs the specification cites, each whole: the reader's source, the
# command, its output and its exit code.
# argv: <tools dir> <firmware dir> <evidence spec/evidence dir> <linux-firmware commit>
set -u
T=$1 F=$2 E=$3 C=$4
mkdir -p "$E"
run() {
	local mode=$1 file=$2 out=$3
	{
		echo "linux-firmware commit $C, file intel/iwlwifi/$file"
		echo "\$ cat fwcontainer.py"
		cat "$T/fwcontainer.py"
		echo
		echo "\$ python3 -I fwcontainer.py $mode $file"
		python3 -I "$T/fwcontainer.py" "$mode" "$F/$file"
		echo "EXIT=$?"
	} > "$E/$out"
	echo "$out: $(wc -l < "$E/$out") lines, $(tail -1 "$E/$out")"
}
run ucode iwlwifi-cc-a0-77.ucode container-cc-a0-77.log
run ucode iwlwifi-ty-a0-gf-a0-89.ucode container-ty-a0-gf-a0-89.log
run pnvm iwlwifi-ty-a0-gf-a0.pnvm container-ty-a0-gf-a0-pnvm.log
{
	echo "linux-firmware commit $C"
	echo "\$ shasum -a 256 LICENCE.iwlwifi_firmware WHENCE iwlwifi-cc-a0-77.ucode iwlwifi-ty-a0-gf-a0-89.ucode iwlwifi-ty-a0-gf-a0.pnvm"
	(cd "$F" && shasum -a 256 LICENCE.iwlwifi_firmware WHENCE iwlwifi-cc-a0-77.ucode iwlwifi-ty-a0-gf-a0-89.ucode iwlwifi-ty-a0-gf-a0.pnvm)
	echo "EXIT=$?"
	echo "\$ cat LICENCE.iwlwifi_firmware"
	cat "$F/LICENCE.iwlwifi_firmware"
	echo "EXIT=$?"
	echo "\$ grep -n -E '^(Driver: iwlwifi|Licence: Redistributable. See LICENCE.iwlwifi_firmware)|cc-a0-77|ty-a0-gf-a0-89|ty-a0-gf-a0.pnvm' WHENCE"
	grep -n -E '^(Driver: iwlwifi|Licence: Redistributable. See LICENCE.iwlwifi_firmware)|cc-a0-77|ty-a0-gf-a0-89|ty-a0-gf-a0.pnvm' "$F/WHENCE"
	echo "EXIT=$?"
} > "$E/firmware-files.log"
echo "firmware-files.log: $(wc -l < "$E/firmware-files.log") lines"
