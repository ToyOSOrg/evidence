# What `scope` relies on in a depth-1 checkout: a commit fetched by SHA at depth 1, then
# diffed against HEAD. Run in an empty directory; prints the changed path and is the
# transcript in shallow-fetch-fixture.out.
git init -q up && cd up && git config user.email x@example.invalid && git config user.name x && git config commit.gpgsign false
echo a > a.rs && git add . && git commit -qm base && B=$(git rev-parse HEAD)
for i in 1 2 3; do echo $i >> doc.md; git add .; git commit -qm d$i; done; H=$(git rev-parse HEAD)
cd .. && git clone -q --depth 1 "file://$PWD/up" co && cd co
git rev-parse --is-shallow-repository
git fetch --no-tags --depth=1 origin "$B"
git diff --name-only -z --no-renames "$B" "$H" | tr '\0' '\n'
