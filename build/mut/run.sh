#!/bin/sh
# Each mutation: make the patch from one literal replacement, check it applies,
# apply it, run the kernel library's cpu and xsave tests, record the exit,
# reverse it, and show the tree clean.
S=<home>/.claude/jobs/2280e09e/tmp/scratchpad/agents/cpufacts
W=<home>/Dev/jan/toyos-cpufacts
cd $W || exit 1
while IFS= read -r line; do
  name=$(echo "$line" | awk '{print $1}'); file=$(echo "$line" | awk '{print $2}')
  rest=$(echo "$line" | sed -E 's/^[^ ]+ +[^ ]+ +//')
  from=${rest%%  =>  *}; to=${rest##*  =>  }
  python3 -E -c "import sys;f,a,b=sys.argv[1:];t=open(f).read();assert t.count(a)==1,a;open(f,'w').write(t.replace(a,b))" "$file" "$from" "$to" || exit 1
  git diff -- "$file" > $S/mut/$name.patch; git checkout -- "$file"
  echo "=== $name"; git apply --check $S/mut/$name.patch && git apply $S/mut/$name.patch && echo applied
  cargo test -p kernel --lib -- cpu:: xsave:: > $S/mut/$name.log 2>&1; echo "cargo test exit $?"
  grep -E '^test .* FAILED$|^test result' $S/mut/$name.log
  git apply -R $S/mut/$name.patch && echo reversed
  git diff --quiet && echo "worktree clean against the index"
done < $S/mut/make.txt
