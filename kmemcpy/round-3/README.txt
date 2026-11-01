The A/B of #1139: base b49e6aec4 against head dc535330f, four boots per bench (1-base, 2-head, 3-head,
4-base), every boot passed. judgement.md judges the rule (../round-1/ab/rule.txt). The table-*.txt
files are judge.py's table.json, laid out per row.

The kernel logs mask their network identifiers: MAC addresses as xx:..., the LAN as 192.0.2.0/24,
public DNS servers as 203.0.113.x.

host/ holds the checks at the follow-up commit (Intel never goes down; the window alone):
- clippy for kernel-copies on x86-64 with -D warnings;
- the x86-64 tests;
- three mutations, each red with exit 101;
- the image build;
- memcpy's disassembly.
