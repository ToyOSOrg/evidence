#!/bin/zsh
# End to end on the development Mac: the host build of sshserver on port 22,
# OpenSSH as a black-box client. A development instrument; nothing runs it at test time.
E=<scratch>/e2e
BIN=<worktree>/target/debug/sshserver
cd $E || exit 1
rm -rf home known_hosts ctl big big.out sftpdir; mkdir -p home sftpdir
cp ../rec/user_ed25519 ../rec/stranger_ed25519 .; chmod 600 user_ed25519 stranger_ed25519
ssh-keygen -y -f user_ed25519 > home/authorized_keys
SSH=(ssh -F /dev/null -o IdentityAgent=none -o IdentitiesOnly=yes -o UserKnownHostsFile=known_hosts -o HostKeyAlias=toyos-e2e -o StrictHostKeyChecking=accept-new -o BatchMode=yes -p 22 -i user_ed25519)
step() { print -r -- "== $1"; }
start() { HOME=$E/home $BIN >> server.log 2>&1 & SERVER=$!; n=0; until grep -q "listening on port 22" server.log 2>/dev/null || [ $((n+=1)) -gt 100 ]; do sleep 0.1; done; }
: > server.log
start
step "1 exec, stdout and exit 0"; $SSH toyos@127.0.0.1 /bin/echo hello; echo "exit $?"
step "2 an exit status"; $SSH -n toyos@127.0.0.1 /bin/sh -c "'exit 7'"; echo "exit $?"
step "3 stderr apart from stdout"; $SSH -n toyos@127.0.0.1 /bin/sh -c "'echo out; echo err >&2'" 2> err.txt; echo "exit $? stderr: $(cat err.txt)"
step "4 50 MB in, its hash out"; head -c 50000000 /dev/urandom > big; local_hash=$(shasum -a 256 < big | cut -d' ' -f1)
remote_hash=$($SSH toyos@127.0.0.1 /usr/bin/shasum -a 256 < big | cut -d' ' -f1); echo "exit $? same: $([ $local_hash = $remote_hash ] && echo yes || echo NO)"
step "5 50 MB out"; $SSH -n toyos@127.0.0.1 /bin/cat $E/big > big.out; echo "exit $? same: $(cmp -s big big.out && echo yes || echo NO)"
step "5b 50 MB out to a reader that pauses, so the client's window runs out"; $SSH -n toyos@127.0.0.1 /bin/cat $E/big | (sleep 3; cat) > big.out; echo "exit $? same: $(cmp -s big big.out && echo yes || echo NO)"
step "6 a program that is not there"; $SSH -n toyos@127.0.0.1 nonexistent; echo "exit $?"
step "7 a shell, which this host does not have"; $SSH -tt -n toyos@127.0.0.1; echo "exit $?"
step "8 sftp: put, ls, get, compare"; head -c 20000000 /dev/urandom > sftpdir/up.bin
print -r -- "put sftpdir/up.bin $E/sftpdir/remote.bin
ls -l $E/sftpdir
get $E/sftpdir/remote.bin sftpdir/down.bin" > batch
sftp -F /dev/null -o IdentityAgent=none -o IdentitiesOnly=yes -o UserKnownHostsFile=known_hosts -o HostKeyAlias=toyos-e2e -o BatchMode=yes -P 22 -i user_ed25519 -b batch toyos@127.0.0.1; echo "exit $? same: $(cmp -s sftpdir/up.bin sftpdir/down.bin && cmp -s sftpdir/up.bin sftpdir/remote.bin && echo yes || echo NO)"
step "9 two channels at once through one connection"; rm -f ctl; $SSH -M -S ctl -fN toyos@127.0.0.1; echo "master exit $?"
( sleep 3; echo late ) | $SSH -S ctl toyos@127.0.0.1 /bin/cat > cat.out & CAT=$!
sleep 1; $SSH -n -S ctl toyos@127.0.0.1 /bin/echo beside; echo "beside exit $?"
wait $CAT; echo "cat exit $? said: $(cat cat.out)"; $SSH -S ctl -O exit toyos@127.0.0.1 2>&1
step "10 a dropped connection ends its program"; $SSH -n toyos@127.0.0.1 /bin/sleep 4321 & CLIENT=$!
sleep 1; echo "running before: $(pgrep -f 'sleep 4321' | wc -l | tr -d ' ')"; kill $CLIENT; wait $CLIENT 2>/dev/null; sleep 1; echo "running after: $(pgrep -f 'sleep 4321' | wc -l | tr -d ' ')"
step "11 a program that reads nothing stops only its own channel"; rm -f ctl; $SSH -M -S ctl -fN toyos@127.0.0.1
yes | $SSH -S ctl toyos@127.0.0.1 /bin/sleep 4 & YES=$!
sleep 1; $SSH -n -S ctl toyos@127.0.0.1 /bin/echo meanwhile; echo "meanwhile exit $?"
wait $YES; echo "sleep exit $?"; $SSH -S ctl -O exit toyos@127.0.0.1 2>&1
kill $SERVER; wait $SERVER 2>/dev/null
echo "== done"
