#!/bin/zsh
# The branch's diff against main after the merge, against its diff before it, hunk headers' line numbers and blob ids aside.
cd <worktree> || exit 9
norm() { grep -v '^index ' | sed -E 's/^(@@ -[0-9]+(,[0-9]+)? \+[0-9]+(,[0-9]+)? @@).*/@@/' }
echo "\$ git diff 177e72a9e 443fb5d10   # the branch before the merge, against its base"
echo "\$ git diff 36aff86fc 51c250261   # the merge, against origin/main"
git diff 177e72a9e 443fb5d10 | norm > <tmp>$$
git diff 36aff86fc 51c250261 | norm > <tmp>$$
diff <tmp>$$ <tmp>$$; echo "diff EXIT=$?"
echo "\$ git merge-base 443fb5d10 36aff86fc"; git merge-base 443fb5d10 36aff86fc
echo "\$ git diff --shortstat 177e72a9e 443fb5d10"; git diff --shortstat 177e72a9e 443fb5d10
echo "\$ git diff --shortstat 36aff86fc 51c250261"; git diff --shortstat 36aff86fc 51c250261
echo "\$ git diff --shortstat 36aff86fc ec72322c8"; git diff --shortstat 36aff86fc ec72322c8
echo "\$ git diff --shortstat 36aff86fc ec72322c8 -- system kernel"; git diff --shortstat 36aff86fc ec72322c8 -- system kernel
echo "\$ git diff --stat 51c250261 ec72322c8"; git diff --stat 51c250261 ec72322c8
rm -f <tmp>$$ <tmp>$$
