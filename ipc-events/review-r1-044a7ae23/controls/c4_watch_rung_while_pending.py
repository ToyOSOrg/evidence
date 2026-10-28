# Negative control for blocker 1: watch the rung even while a connect is unanswered.
import sys
p = sys.argv[1] + '/system/netstack/src/serve.rs'
s = open(p).read()
new = "                Some(holding) if stream.answer.is_some() => poller.watch(&holding.connection, READABLE, token),\n"
assert s.count(new) == 1
open(p, 'w').write(s.replace(new, ''))
