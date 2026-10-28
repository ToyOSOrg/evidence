# Two red controls at the committed head, each applied as a checked patch, run and restored.
# drop-removed: the Immutable Drop reverse-applied (the fix undone).
# leak-read: a spawn's copy-read image keeps one extra handle to its region.
S=$SCRATCH/r1
P=$SCRATCH
cd $WORKTREE || exit 9
git rev-parse HEAD; test -z "$(git status --porcelain)" || { echo "tree not clean"; exit 9; }
run() { # $1 name, $2 patch, $3 apply flags
  echo "=== control $1"
  git apply $3 --check $2 && git apply $3 $2 || exit 9
  git diff
  cargo test --test toyos-build -- a_spawn_from_an_image_frees_it_when_the_child_ends
  echo "control $1 exit $?"
  git checkout -- sdk/toyos/src || { echo "RESTORE FAILED"; exit 9; }
  test -z "$(git status --porcelain)" || { echo "RESTORE FAILED"; exit 9; }
}
run drop-removed $P/fix.patch -R
run leak-read $S/leak-read.patch ""
echo restored; git status --porcelain
