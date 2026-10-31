# Negative controls: each mutation applied alone, its test run, then restored.
import sys
CONTROLS = {
  # A message taken with one handle fewer than it carried: its handles come apart from it.
  'q1-short-batch': ('kernel/pure/message.rs',
     "Some(Ok((head, self.handles.drain(..head.handles))))",
     "Some(Ok((head, self.handles.drain(..head.handles.saturating_sub(1)))))"),
  # The handle bound not asked: a queue past 64 handles.
  'q2-no-handle-bound': ('kernel/pure/message.rs',
     "            && self.handles.len() + handles <= MAX_QUEUED_HANDLES\n    }",
     "            && handles <= MAX_QUEUED_HANDLES\n    }"),
  # A receive too small takes the message anyway, cutting it.
  'q3-short-buffer-taken': ('kernel/pure/message.rs',
     "        if head.len > buf || head.handles > cap {\n            return Some(Err(Untaken::TooSmall));\n        }",
     "        if head.handles > cap {\n            return Some(Err(Untaken::TooSmall));\n        }"),
  # The SDK reads the type as part of the payload.
  's1-type-in-payload': ('sdk/toyos/src/ipc.rs',
     "let payload_len = got.len.checked_sub(TYPE_LEN).ok_or(Refused::Malformed)?;",
     "let payload_len = got.len;"),
}
name, mode = sys.argv[1], sys.argv[2]
path, old, new = CONTROLS[name]
s = open(path).read()
if mode == 'apply':
    assert s.count(old) == 1, (name, 'anchor not unique')
    open(path, 'w').write(s.replace(old, new))
else:
    assert s.count(new) == 1, (name, 'mutation not present')
    open(path, 'w').write(s.replace(new, old))
