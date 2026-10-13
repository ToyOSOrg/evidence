# Writes each mutation as a patch against the worktree's HEAD, from exact
# string replacements; a replacement that does not match exactly once fails.
import subprocess, sys, os
ROOT = '<path>
HERE = os.path.dirname(os.path.abspath(__file__))
CLIP = 'system/compositor/desktop/src/clipboard.rs'
STREAM = 'lib/vdagent/src/stream.rs'
SETS = 'system/vdagent/bridge/src/sets.rs'
M = [
 ('m01-size-bound-lifted', 'toyos-vdagent', 'a_declared_size_past_the_bound_is_counted_off_and_the_next_message_decodes', STREAM,
  [('at_most(MAX_DATA as u64).is_err()', 'at_most(u32::MAX as u64).is_err()')]),
 ('m11-bridge-set-sent-back', 'toyos-desktop', 'a_bridge_set_is_never_sent_back', CLIP,
  [('    pub fn set(&self) -> Landing {\n', '    pub fn set(&mut self) -> Landing {\n        self.unsent = true;\n')]),
 ('m12-delivered-unasked', 'toyos-desktop', 'nothing_is_sent_unasked', CLIP,
  [('let now = self.asked && self.unsent;', 'let now = self.unsent;')]),
 ('m13-stale-set-lands', 'toyos-desktop', 'a_bridge_set_made_before_a_delivery_was_seen_is_refused', CLIP,
  [('            false => Landing::Stale,\n        }\n    }\n\n    /// The watcher opens', '            false => Landing::Lands,\n        }\n    }\n\n    /// The watcher opens')]),
 ('m14-judged-at-begin-alone', 'toyos-desktop', 'a_delivery_between_begin_and_commit_refuses_the_commit', CLIP,
  [('                *landing = Landing::Stale;\n', '                let _ = landing;\n')]),
 ('m17-judged-at-commit-alone', 'toyos-desktop', 'a_region_opened_after_a_delivery_refuses_the_commit_after_the_next_ask', CLIP,
  [('        self.region.take()\n', '        let landing = self.set();\n        self.region.take().map(|(region, _)| (region, landing))\n')]),
 ('m18-leave-forgets-the-unsent-copy', 'toyos-desktop', 'a_copy_made_while_nobody_watched_is_sent_at_the_next_ask', CLIP,
  [('        self.asked = false;\n        self.region = None;\n', '        self.asked = false;\n        self.unsent = false;\n        self.region = None;\n')]),
 ('m19-leave-keeps-the-ask', 'toyos-desktop', 'a_copy_made_while_nobody_watched_is_sent_at_the_next_ask', CLIP,
  [('        self.asked = false;\n        self.region = None;\n', '        self.region = None;\n')]),
 ('m20-leave-keeps-the-region', 'toyos-desktop', 'a_watcher_that_leaves_takes_its_region', CLIP,
  [('        self.asked = false;\n        self.region = None;\n', '        self.asked = false;\n')]),
 ('m21-a-set-goes-while-one-is-in-flight', 'toyos-vdagent-bridge', 'a_set_waits_for_the_answer_to_the_one_in_flight', SETS,
  [('        if self.in_flight {\n', '        if false {\n')]),
 ('m22-the-oldest-set-waits', 'toyos-vdagent-bridge', 'only_the_newest_set_waits', SETS,
  [('            self.queued = Some(text);\n', '            self.queued.get_or_insert(text);\n')]),
 ('m23-a-delivery-keeps-the-set-behind', 'toyos-vdagent-bridge', 'a_delivered_guest_copy_drops_the_set_behind', SETS,
  [('        self.queued = None;\n', '')]),
 ('m24-growth-past-the-declared-size', 'toyos-vdagent', 'a_kept_message_buffers_no_more_than_it_declares', STREAM,
  [('.max(take).min(data.len() + *left);', '.max(take);')]),
]
lst = []
for name, pkg, test, path, reps in M:
    src = open(os.path.join(ROOT, path)).read()
    out = src
    for a, b in reps:
        assert out.count(a) == 1, (name, a)
        out = out.replace(a, b)
    tmp = os.path.join(HERE, name + '.mutated')
    open(tmp, 'w').write(out)
    d = subprocess.run(['diff', '-u', '--label', 'a/' + path, '--label', 'b/' + path, os.path.join(ROOT, path), tmp], capture_output=True, text=True)
    assert d.returncode == 1, name
    open(os.path.join(HERE, name + '.patch'), 'w').write(d.stdout)
    os.remove(tmp)
    lst.append(f'{name} {pkg} {test}')
open(os.path.join(HERE, 'list.txt'), 'w').write('\n'.join(lst) + '\n')
print('\n'.join(lst))
