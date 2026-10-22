#!/bin/zsh
# Records the seven fixture sessions with the host's OpenSSH as a development
# instrument. Run from the recording directory so every path ssh logs is relative.
R=<scratch>/rec
WT=<worktree>
BIN=$WT/target/debug/examples/record
FIX=$WT/build/ssh/tests/fixtures
PORT=22741
cd $R || exit 1
COMMON=(-F /dev/null -o IdentityAgent=none -o IdentitiesOnly=yes -o UserKnownHostsFile=known_hosts -o HostKeyAlias=toyos-test -o StrictHostKeyChecking=yes -o BatchMode=yes -p $PORT)

serve() { # name seed comment
  $BIN $PORT $2 $FIX/$1.transcript "$3" 2> $1.server.log &
  SERVER=$!
  n=0; until lsof -nP -iTCP:$PORT -sTCP:LISTEN > /dev/null 2>&1 || [ $((n+=1)) -gt 50 ]; do sleep 0.1; done
  [ $n -le 50 ] || { echo "$1: the recorder never listened"; kill $SERVER; exit 1; }
}
finish() { # name
  wait $SERVER; echo "recorder EXIT=$?" >> $1.exit
}

serve exec 5a "ssh -n toyos@127.0.0.1 'echo hello'"
CMD=(ssh -v -n $COMMON -i user_ed25519 toyos@127.0.0.1 "echo hello")
print -r -- "${(q)CMD[@]}" > exec.cmd
"${CMD[@]}" > exec.stdout 2> exec.client.log; echo "ssh EXIT=$?" > exec.exit
finish exec

serve stdin 3c "seq 1 2000 | ssh toyos@127.0.0.1 cat"
CMD=(ssh -v $COMMON -i user_ed25519 toyos@127.0.0.1 cat)
print -r -- "seq 1 2000 | ${(q)CMD[@]}" > stdin.cmd
seq 1 2000 | "${CMD[@]}" > stdin.stdout 2> stdin.client.log; echo "ssh EXIT=$?" > stdin.exit
finish stdin

serve rekey 77 "seq 1 3000 | ssh -o RekeyLimit=4K toyos@127.0.0.1 cat"
CMD=(ssh -v $COMMON -o RekeyLimit=4K -i user_ed25519 toyos@127.0.0.1 cat)
print -r -- "seq 1 3000 | ${(q)CMD[@]}" > rekey.cmd
seq 1 3000 | "${CMD[@]}" > rekey.stdout 2> rekey.client.log; echo "ssh EXIT=$?" > rekey.exit
finish rekey

serve stranger 11 "ssh -i stranger_ed25519 toyos@127.0.0.1 true (a key the server does not name)"
CMD=(ssh -v -n $COMMON -i stranger_ed25519 toyos@127.0.0.1 true)
print -r -- "${(q)CMD[@]}" > stranger.cmd
"${CMD[@]}" > stranger.stdout 2> stranger.client.log; echo "ssh EXIT=$?" > stranger.exit
finish stranger

serve rsa 22 "ssh -i user_rsa toyos@127.0.0.1 true (an RSA key)"
CMD=(ssh -v -n $COMMON -i user_rsa toyos@127.0.0.1 true)
print -r -- "${(q)CMD[@]}" > rsa.cmd
"${CMD[@]}" > rsa.stdout 2> rsa.client.log; echo "ssh EXIT=$?" > rsa.exit
finish rsa

serve forward 44 "ssh -W 127.0.0.1:9 toyos@127.0.0.1 (a direct-tcpip channel)"
CMD=(ssh -v $COMMON -i user_ed25519 -W 127.0.0.1:9 toyos@127.0.0.1)
print -r -- "${(q)CMD[@]}" > forward.cmd
"${CMD[@]}" < /dev/null > forward.stdout 2> forward.client.log; echo "ssh EXIT=$?" > forward.exit
finish forward

serve curve25519 66 "ssh -n -o KexAlgorithms=curve25519-sha256 toyos@127.0.0.1 'echo hello' (the classical method)"
CMD=(ssh -v -n $COMMON -o KexAlgorithms=curve25519-sha256 -i user_ed25519 toyos@127.0.0.1 "echo hello")
print -r -- "${(q)CMD[@]}" > curve25519.cmd
"${CMD[@]}" > curve25519.stdout 2> curve25519.client.log; echo "ssh EXIT=$?" > curve25519.exit
finish curve25519
