#!/bin/zsh
# Records stage 2's fixture sessions with the host's OpenSSH as a development
# instrument. Run from the recording directory so every path ssh logs is relative.
R=~/.claude/jobs/2280e09e/tmp/scratchpad/agents/ssh/rec2
WT=~/Dev/jan/toyos-ssh-adopt
BIN=$WT/target/debug/examples/record
FIX=$WT/build/ssh/tests/fixtures
PORT=22742
cd $R || exit 1
COMMON=(-F /dev/null -o IdentityAgent=none -o IdentitiesOnly=yes -o UserKnownHostsFile=known_hosts -o HostKeyAlias=toyos-test -o StrictHostKeyChecking=yes -o BatchMode=yes -p $PORT -i user_ed25519)

serve() { # name seed comment
  $BIN $PORT $2 $FIX/$1.transcript "$3" 2> $1.server.log &
  SERVER=$!
  n=0; until lsof -nP -iTCP:$PORT -sTCP:LISTEN > /dev/null 2>&1 || [ $((n+=1)) -gt 50 ]; do sleep 0.1; done
  [ $n -le 50 ] || { echo "$1: the recorder never listened"; kill $SERVER; exit 1; }
}
finish() { # name
  wait $SERVER; echo "recorder EXIT=$?" >> $1.exit
}

serve shell 5c "printf 'one\\\\ntwo\\\\n' | ssh -tt toyos@127.0.0.1 (a shell with a terminal)"
CMD=(ssh -v -tt $COMMON toyos@127.0.0.1)
print -r -- "printf 'one\\ntwo\\n' | ${(q)CMD[@]}" > shell.cmd
printf 'one\ntwo\n' | "${CMD[@]}" > shell.stdout 2> shell.client.log; echo "ssh EXIT=$?" > shell.exit
finish shell

printf 'hello from the client\n' > upload.txt
print -r -- "put upload.txt
ls -l
get upload.txt download.txt
rm upload.txt" > sftp.batch
serve sftp 5f "sftp -b sftp.batch toyos@127.0.0.1 (put, ls -l, get and an rm the server does not serve)"
CMD=(sftp -v -b sftp.batch -P $PORT ${COMMON[1,-5]} -i user_ed25519 toyos@127.0.0.1)
print -r -- "${(q)CMD[@]}" > sftp.cmd
"${CMD[@]}" > sftp.stdout 2> sftp.client.log; echo "sftp EXIT=$?" > sftp.exit
cmp upload.txt download.txt && echo "cmp: the same" >> sftp.exit
finish sftp

serve channels 6c "ssh -M -S ctl -fN toyos@127.0.0.1; through ctl, a cat held open while an echo runs beside it; -O exit (two channels open at once)"
rm -f ctl in
mkfifo in
CMD=(ssh -v -M -S ctl -fN $COMMON toyos@127.0.0.1)
print -r -- "${(q)CMD[@]}" > channels.cmd
"${CMD[@]}" > channels.stdout 2> channels.client.log; echo "master EXIT=$?" > channels.exit
CAT=(ssh -S ctl $COMMON toyos@127.0.0.1 cat)
print -r -- "${(q)CAT[@]} < in &" >> channels.cmd
"${CAT[@]}" < in > channels.cat.stdout 2>> channels.client.log &
CATPID=$!
exec 3> in
n=0; until grep -q "exec: cat" channels.cat.stdout 2>/dev/null || [ $((n+=1)) -gt 100 ]; do sleep 0.1; done
print -u3 one
n=0; until grep -q "^one" channels.cat.stdout 2>/dev/null || [ $((n+=1)) -gt 100 ]; do sleep 0.1; done
ECHO=(ssh -n -S ctl $COMMON toyos@127.0.0.1 "echo two")
print -r -- "${(q)ECHO[@]}" >> channels.cmd
"${ECHO[@]}" >> channels.stdout 2>> channels.client.log; echo "echo EXIT=$?" >> channels.exit
print -u3 three
exec 3>&-
wait $CATPID; echo "cat EXIT=$?" >> channels.exit
CMD=(ssh -S ctl -O exit $COMMON toyos@127.0.0.1)
print -r -- "${(q)CMD[@]}" >> channels.cmd
"${CMD[@]}" >> channels.stdout 2>> channels.client.log; echo "exit EXIT=$?" >> channels.exit
finish channels
