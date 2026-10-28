# Red control: the Immutable Drop removed (the base's sdk), run, then restored.
S=$SCRATCH
cd $WORKTREE || exit 9
git rev-parse HEAD
git apply -R --check $S/fix.patch && git apply -R $S/fix.patch || exit 9
git diff --stat
cargo test --test toyos-build -- a_spawn_from_an_image_frees_it_when_the_child_ends
echo "control exit $?"
git apply $S/fix.patch || { echo "RESTORE FAILED"; exit 9; }
git diff --stat
