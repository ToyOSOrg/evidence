# Every use, outside this repository, of a name this branch removes or reshapes.
P='OBJECT_KINDS|recv_handles_exact|grown_since|census::|Census|CENSUS_KIND|handle_recv|FileType::SharedMemory|SharedMemory::adopt|ObjectKind|SHM_PAGE|DeviceMemory'
for root in /Users/jan/Dev/jan/forks /Users/jan/.cargo/git/checkouts /Users/jan/Dev/jan/toyos-netring-s1/rust/library; do
  echo "== $root: $(grep -rIli --include='*.rs' toyos "$root" 2>/dev/null | wc -l | tr -d ' ') .rs files name toyos; those that also match /$P/:"
  grep -rIli --include='*.rs' toyos "$root" 2>/dev/null | while read -r f; do
    grep -nE "$P" "$f" | sed "s|^|$f:|"
  done
done
echo "== end"
