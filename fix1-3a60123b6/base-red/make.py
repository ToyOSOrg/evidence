# Each new test that compiles against 519b43215's source, inserted into that
# file as of 519b43215, written as a patch against it.
import subprocess, os
ROOT = '<path>
HERE = os.path.dirname(os.path.abspath(__file__))
BASE = '519b43215'
def base(path):
    return subprocess.run(['git', '-C', ROOT, 'show', f'{BASE}:{path}'], capture_output=True, text=True, check=True).stdout
def test_text(path, name):
    src = open(os.path.join(ROOT, path)).read()
    i = src.index(f'fn {name}()')
    # back up to the doc comment / attribute block
    start = src.rfind('\n\n', 0, i) + 1
    end = src.index('\n    }\n', i) + len('\n    }\n')
    return src[start:end]
T = [
 ('clipboard-named', 'toyos-desktop', 'system/compositor/desktop/src/clipboard.rs', 'a_region_opened_after_a_delivery_refuses_the_commit_after_the_next_ask'),
 ('stream-header', 'toyos-vdagent', 'lib/vdagent/src/stream.rs', 'a_refusal_is_named_at_its_header_before_its_data_arrives'),
 ('stream-capacity', 'toyos-vdagent', 'lib/vdagent/src/stream.rs', 'a_kept_message_buffers_no_more_than_it_declares'),
]
lst = []
for name, pkg, path, test in T:
    b = base(path)
    t = test_text(path, test)
    at = b.rindex('\n}\n')
    out = b[:at] + '\n' + t.rstrip('\n') + '\n' + b[at:]
    tmp = os.path.join(HERE, name + '.base')
    mut = os.path.join(HERE, name + '.with-test')
    open(tmp, 'w').write(b); open(mut, 'w').write(out)
    d = subprocess.run(['diff', '-u', '--label', 'a/' + path, '--label', 'b/' + path, tmp, mut], capture_output=True, text=True)
    assert d.returncode == 1
    open(os.path.join(HERE, name + '.patch'), 'w').write(d.stdout)
    os.remove(tmp); os.remove(mut)
    lst.append(f'{name} {pkg} {path} {test}')
open(os.path.join(HERE, 'list.txt'), 'w').write('\n'.join(lst) + '\n')
