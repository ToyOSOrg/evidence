# For one captured log: does the kernel's `spawn: /system/bin/<job> pid=` record
# (the format before this change) ever precede the runner's `===TEST_START <job>===`?
# A spawn of <job> seen while <job> is not started counts as pending; a start
# with one pending counts "before". A spawn seen after its start counts "after".
FNR == 1 { delete pending; delete started }
{
  if (match($0, /===TEST_START [^=]+===/)) {
    job = substr($0, RSTART + 14, RLENGTH - 17)
    starts++
    if (pending[job]) { before++; print FILENAME ": " job > "/dev/stderr" }
    pending[job] = 0; started[job] = 1
  } else if (match($0, /===TEST_END [^ =]+/)) {
    job = substr($0, RSTART + 12, RLENGTH - 12)
    started[job] = 0; pending[job] = 0
  } else if (match($0, /spawn: \/system\/bin\/[^ ]+ pid=/)) {
    job = substr($0, RSTART + 19, RLENGTH - 24)
    if (started[job]) { after++; started[job] = 0 } else { pending[job] = 1 }
  }
}
END { printf "files=%d starts=%d spawn-after-start=%d spawn-before-start=%d\n", files, starts, after, before }
FNR == 1 { files++ }
