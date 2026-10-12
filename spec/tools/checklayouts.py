# Checks the specification's layout tables: in every table whose header starts "| Offset | Width",
# each row must start where the previous one ends, and a table whose widths are all numbers must
# end at the size the nearest preceding line states as "(N bytes" or "N bytes)" or ", N bytes".
# Prints one line per table and exits 1 on any mismatch.
# argv: <markdown>
import re
import sys

lines = open(sys.argv[1]).read().split('\n')
bad = 0
i = 0
while i < len(lines):
    if not lines[i].startswith('| Offset | Width'):
        i += 1
        continue
    start = i
    j = i + 2
    rows = []
    while j < len(lines) and lines[j].startswith('|'):
        cells = [c.strip() for c in lines[j].strip('|').split('|')]
        rows.append((j + 1, cells[0], cells[1]))
        j += 1
    size = None
    for k in range(start - 1, max(start - 12, -1), -1):
        m = re.search(r'\((\d[\d,]*) bytes|(\d[\d,]*) bytes\)|, (\d[\d,]*) bytes', lines[k])
        if m:
            size = int((m.group(1) or m.group(2) or m.group(3)).replace(',', ''))
            break
    expect = None
    numeric = True
    problems = []
    for (ln, off, width) in rows:
        try:
            o = int(off)
        except ValueError:
            problems.append(f'line {ln}: offset {off!r} is not a number')
            numeric = False
            break
        if expect is not None and o != expect:
            problems.append(f'line {ln}: offset {o}, but the previous row ends at {expect}')
        try:
            w = int(width)
            expect = o + w
        except ValueError:
            numeric = False
            expect = None
    first = rows[0][1] if rows else '?'
    end = expect if numeric else None
    if numeric and size is not None and end != size and first == '0':
        problems.append(f'ends at {end}, heading states {size}')
    status = 'ok' if not problems else 'MISMATCH'
    print(f'table at line {start + 1}: rows {len(rows)}, starts {first}, ends {end}, stated {size}: {status}')
    for p in problems:
        print('   ', p)
    bad += bool(problems)
    i = j
print(f'{bad} table(s) with mismatches')
sys.exit(1 if bad else 0)
