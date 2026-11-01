#!/usr/bin/env bash
# W2a reference capture, revision 2: a WPA2-Personal 4-way handshake, a PTK rekey and a group
# key handshake between two wpa_supplicant instances over two mac80211_hwsim radios, one in AP
# mode (mode=2).
#
# Revision 1 (the T14 bench, wpa_supplicant v2.10) recorded the initial handshakes. Its AP parsed
# group_rekey and wpa_ptk_rekey in the network block but never rekeyed in 64 s. This revision
# asks for the rekeys from the other ends: the station's own wpa_ptk_rekey (a supplicant sends an
# EAPOL-Key Request when its PTK's lifetime ends), and the AP's control interface (REKEY_GTK,
# tried through wpa_cli and recorded whatever it answers). Rekey frames travel encrypted, so
# the oracle for their bytes is the station's -dd log, which prints each EAPOL-Key frame in
# the clear.
#
# Usage: sudo bash capture.sh <outdir>
#
# Everything is transient: one module load, two interfaces set unmanaged in NetworkManager for
# the boot, processes this script starts (stopped by PID), files under <outdir>. It installs
# nothing and touches no other interface. The module is unloaded at the end.
#
# Each scenario writes to <outdir>/<scenario>/:
#   air.pcap      every frame on the simulated medium (radiotap, from hwsim0);
#   rekey-gtk.txt what the AP's control interface answered to REKEY_GTK;
#   ap.log, sta.log  wpa_supplicant -dd -K -t: includes the derived PTK, GTK and IGTK, the
#                 independent oracle for the supplicant's keys;
#   result        one line: what completed.
set -uo pipefail

out=${1:?usage: sudo bash capture.sh <outdir>}
[ "$(id -u)" = 0 ] || { echo "run as root"; exit 2; }
mkdir -p "$out"
exec > >(tee "$out/capture.log") 2>&1

SSID=toyos-w2a
PASSPHRASE=ThisIsAPassword
AP_MAC=02:00:00:00:a0:01
STA_MAC=02:00:00:00:b0:02
WPAS=$(command -v wpa_supplicant) || { echo "no wpa_supplicant"; exit 2; }
command -v tcpdump >/dev/null || { echo "no tcpdump"; exit 2; }
WPA_CLI=$(command -v wpa_cli) || echo "no wpa_cli: no group key rekey will be asked for"
"$WPAS" -v | head -1

if lsmod | grep -q '^mac80211_hwsim'; then
    echo "mac80211_hwsim is already loaded: refusing to share it"
    exit 2
fi

pids=()
cleanup() {
    for p in "${pids[@]}"; do kill "$p" 2>/dev/null; done
    for p in "${pids[@]}"; do wait "$p" 2>/dev/null; done
    pids=()
}
trap 'cleanup; modprobe -r mac80211_hwsim 2>/dev/null' EXIT

# Waits up to $2 seconds for file $1 to hold $4 (default 1) lines matching $3.
await() {
    local file=$1 secs=$2 pattern=$3 want=${4:-1} i
    for ((i = 0; i < secs * 10; i++)); do
        [ "$(grep -c -- "$pattern" "$file" 2>/dev/null)" -ge "$want" ] && return 0
        sleep 0.1
    done
    echo "timed out after ${secs}s waiting for $want of '$pattern' in $file"
    return 1
}

wireless() {
    for n in /sys/class/net/*; do [ -e "$n/phy80211" ] && echo "${n##*/}"; done | sort
}

before=$(wireless)
modprobe mac80211_hwsim radios=2 || { echo "modprobe failed"; exit 1; }
radios=()
for ((i = 0; i < 100; i++)); do
    mapfile -t radios < <(comm -13 <(echo "$before") <(wireless))
    [ "${#radios[@]}" -ge 2 ] && [ -e /sys/class/net/hwsim0 ] && break
    sleep 0.1
done
[ "${#radios[@]}" = 2 ] || { echo "expected two new radios, have: ${radios[*]}"; exit 1; }
AP=${radios[0]}
STA=${radios[1]}
echo "AP interface $AP, station interface $STA"

if command -v nmcli >/dev/null && nmcli -t general status >/dev/null 2>&1; then
    for d in "$AP" "$STA"; do nmcli device set "$d" managed no; done
    for ((i = 0; i < 100; i++)); do
        n=$(nmcli -t -f DEVICE,STATE device | grep -cE "^($AP|$STA):unmanaged$")
        [ "$n" = 2 ] && break
        sleep 0.1
    done
    nmcli -t -f DEVICE,STATE device | grep -E "^($AP|$STA):"
fi

ip link set "$AP" down && ip link set "$AP" address "$AP_MAC"
ip link set "$STA" down && ip link set "$STA" address "$STA_MAC"
ip link set hwsim0 up

# The station's PTK lifetime, in seconds, when this wpa_supplicant knows the field.
ptk_rekey=""
grep -aq wpa_ptk_rekey "$WPAS" && ptk_rekey="wpa_ptk_rekey=6"
echo "station PTK lifetime: ${ptk_rekey:-none}"

scenario() {
    local name=$1 pmf=$2 dir="$out/$1"
    mkdir -p "$dir"
    echo "== $name (ieee80211w=$pmf)"
    cat > "$dir/ap.conf" <<CONF
ctrl_interface=$dir/ap-ctrl
eapol_version=2
network={
    ssid="$SSID"
    mode=2
    frequency=2412
    proto=RSN
    key_mgmt=WPA-PSK
    pairwise=CCMP
    group=CCMP
    psk="$PASSPHRASE"
    ieee80211w=$pmf
}
CONF
    cat > "$dir/sta.conf" <<CONF
ctrl_interface=$dir/sta-ctrl
eapol_version=2
network={
    ssid="$SSID"
    scan_ssid=1
    proto=RSN
    key_mgmt=WPA-PSK
    pairwise=CCMP
    group=CCMP
    psk="$PASSPHRASE"
    ieee80211w=$pmf
    $ptk_rekey
}
CONF
    tcpdump -Z root -U -i hwsim0 -w "$dir/air.pcap" > "$dir/tcpdump-air.log" 2>&1 &
    pids+=($!)
    await "$dir/tcpdump-air.log" 10 "listening on" || { cleanup; return; }

    "$WPAS" -D nl80211 -i "$AP" -c "$dir/ap.conf" -dd -K -t > "$dir/ap.log" 2>&1 &
    pids+=($!)
    if ! await "$dir/ap.log" 20 "AP-ENABLED"; then
        echo "$name: the AP did not start" | tee "$dir/result"
        cleanup
        return
    fi
    "$WPAS" -D nl80211 -i "$STA" -c "$dir/sta.conf" -dd -K -t > "$dir/sta.log" 2>&1 &
    pids+=($!)
    if ! await "$dir/sta.log" 30 "CTRL-EVENT-CONNECTED"; then
        echo "$name: the station did not connect" | tee "$dir/result"
        cleanup
        return
    fi
    local done="connected"
    if [ -n "$WPA_CLI" ]; then
        "$WPA_CLI" -p "$dir/ap-ctrl" -i "$AP" REKEY_GTK > "$dir/rekey-gtk.txt" 2>&1
        echo "REKEY_GTK answered: $(tr '\n' ' ' < "$dir/rekey-gtk.txt")"
        await "$dir/sta.log" 15 "Group rekeying completed"
        done="$done, $(grep -c 'Group rekeying completed' "$dir/sta.log") group rekeys"
    fi
    if [ -n "$ptk_rekey" ]; then
        await "$dir/sta.log" 30 "WPA: Key negotiation completed" 2
        done="$done, $(grep -c 'WPA: Key negotiation completed' "$dir/sta.log") 4-way completions"
    fi
    echo "$name: $done" | tee "$dir/result"
    cleanup
}

scenario psk 0
scenario pmf 2
ls -l "$out"/*/
