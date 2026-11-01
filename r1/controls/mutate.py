# mutate.py <worktree> <log> : each mutation applied, its test run, restored.
# A mutation whose test still passes is reported, never retried.
import subprocess, sys, pathlib
tree, log = pathlib.Path(sys.argv[1]), open(sys.argv[2], 'w')
M = [
    ('write pin grows the size at its pin', 'kernel/pure/paged.rs', 'kernel',
     '''        if needs_slot {
            self.dirty_held += 1;
        }
        Ok(frame)''',
     '''        if needs_slot {
            self.dirty_held += 1;
        }
        o.size = o.size.max((page + 1) * PAGE);
        Ok(frame)''',
     ['cargo', 'test', '--lib', 'paged::tests::a_reader_racing_an_extending_write']),
    ('unpin not keyed on the frame', 'kernel/pure/paged.rs', 'kernel',
     '''        if s.frame != Some(frame) {
            return;
        }
        s.state.write_pins''',
     '''        s.state.write_pins''',
     ['cargo', 'test', '--lib', 'paged::tests::an_unpin_after_a_shrink']),
    ('a clean supply grows the size', 'kernel/pure/paged.rs', 'kernel',
     '''        if dirty {
            o.size = o.size.max(end);
        }
        Ok(Supplied::Installed)''',
     '''        o.size = o.size.max(end);
        Ok(Supplied::Installed)''',
     ['cargo', 'test', '--lib', 'paged::tests::a_clean_supply_past_the_size']),
    ('a withdrawal walks the range', 'kernel/pure/paged.rs', 'kernel',
     '''        if count > o.pages as u64 {''',
     '''        if false {''',
     ['cargo', 'test', '--lib', 'paged::tests::a_withdrawal_of_a_long_range']),
    ('a data read fills the cache', 'system/fileserver/src/data.rs', 'system/fileserver',
     '''            read = cache.block_on(cache.read_data(first, &mut span[..run as usize])).map_err(disk_word);''',
     '''            read = cache.block_on(cache.read(first, &mut span[..run as usize])).map_err(disk_word);''',
     ['cargo', 'test', '--lib', 'data::tests::a_files_pages_pass_the_cache_by']),
    ('a refused write is not cut back', 'system/fileserver/src/pages.rs', 'system/fileserver',
     '''            let resized = self.pg().resize(id, cut).map_err(word).and(volume.truncate(node, cut));''',
     '''            let resized = self.pg().resize(id, cut).map_err(word);''',
     ['cargo', 'test', '--lib', 'pages::tests::a_write_refused_part_way']),
    ('a landing is not marked dirty', 'system/fileserver/src/pages.rs', 'system/fileserver',
     '''        if len > 0 {
            let f = self.files.get_mut(&identity).expect("a file being written");''',
     '''        if len > usize::MAX - 1 {
            let f = self.files.get_mut(&identity).expect("a file being written");''',
     ['cargo', 'test', '--lib', 'pages::tests::a_write_past_the_dirty_ceiling']),
    ('a core frame is given back as it leaves', 'kernel/pure/paged.rs', 'kernel',
     '''        if self.held() < self.core {''',
     '''        if false {''',
     ['cargo', 'test', '--lib', 'paged::tests::a_core_is_kept']),
    ('a refused create makes no room', 'system/fileserver/src/pages.rs', 'system/fileserver',
     '''                Err(Refused::NoRoom) if self.drop_oldest(volume, identity) => {}
''',
     '',
     ['cargo', 'test', '--lib', 'pages::tests::an_object_refused_for_room']),
    ('a truncating open does not empty the object', 'system/fileserver/src/pages.rs', 'system/fileserver',
     '''        self.pg().resize(id, 0).map_err(word)?;''',
     '''        let _ = id;''',
     ['cargo', 'test', '--lib', 'pages::tests::a_truncating_open']),
    ('room drops an open file first', 'system/fileserver/src/pages.rs', 'system/fileserver',
     '''        self.opens == 0 && !self.held && self.dirty.is_none()''',
     '''        self.dirty.is_none()''',
     ['cargo', 'test', '--lib', 'pages::tests::room_is_made']),
]
bad = 0
for name, rel, crate, old, new, test in M:
    path = tree / rel
    text = path.read_text()
    assert text.count(old) == 1, f'{name}: the mutation site is not unique'
    path.write_text(text.replace(old, new))
    try:
        r = subprocess.run(test, cwd=tree / crate, capture_output=True, text=True)
        out = r.stdout + r.stderr
        built = 'error[' not in out and 'could not compile' not in out
        verdict = 'RED' if built and r.returncode != 0 else ('DID NOT BUILD' if not built else 'GREEN (control fails)')
        bad += verdict != 'RED'
        log.write(f'=== {name}: {verdict} (exit {r.returncode})\n$ {" ".join(test)}\n{out[-3000:]}\n')
        print(f'{name}: {verdict}')
    finally:
        path.write_text(text)
diff = subprocess.run(['git', 'status', '--porcelain'], cwd=tree, capture_output=True, text=True).stdout
log.write(f'tree after restore: {diff!r}\n')
print('restored' if not diff.strip() else f'NOT RESTORED: {diff}')
sys.exit(1 if bad or diff.strip() else 0)
