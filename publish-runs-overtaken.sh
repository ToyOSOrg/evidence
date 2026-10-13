#!/bin/sh
# For main's last N publish.yml push runs: the time every job of the run had
# finished (the earliest a `release` job needing them all could read main's
# tip), and whether main had already moved past the run's head by then, read
# as: a later push run of publish.yml was created at or before that time.
# Read-only: GitHub's REST API through gh, no write.
set -eu
N=${1:-100}
echo "# gh api repos/ToyOSOrg/ToyOS/actions/workflows/publish.yml/runs?event=push&branch=main, newest $N"
echo "# columns: run head created jobs_done next_push_created overtaken"
gh api "repos/ToyOSOrg/ToyOS/actions/workflows/publish.yml/runs?event=push&branch=main&per_page=$N" \
  --jq '.workflow_runs[] | [.id, .head_sha[0:9], .created_at] | @tsv' > runs.tsv
next=""
total=0; over=0
while IFS="$(printf '\t')" read -r id sha created; do
  done_at=$(gh api "repos/ToyOSOrg/ToyOS/actions/runs/$id/jobs?per_page=100&filter=latest" --jq '[.jobs[].completed_at // "9999"] | max')
  if [ -n "$next" ] && [ ! "$next" \> "$done_at" ]; then o=yes; over=$((over+1)); else o=no; fi
  echo "$id $sha $created $done_at ${next:-none} $o"
  total=$((total+1))
  next=$created
done < runs.tsv
rm runs.tsv
echo "# runs=$total overtaken=$over"
