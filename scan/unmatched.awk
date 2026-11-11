# Starts with no spawn record of their job before that job's end or the end of the file.
function flush(   j) { for (j in open) print prev ":" open[j] ": " j " open at the end of the file"; split("", open) }
FNR == 1 { if (prev != "") flush(); prev = FILENAME }
/===TEST_START [^=]+===/ { match($0, /===TEST_START [^=]+===/); j = substr($0, RSTART + 14, RLENGTH - 17); open[j] = FNR; next }
/===TEST_END / { match($0, /===TEST_END [^ =]+/); j = substr($0, RSTART + 12, RLENGTH - 12); if (j in open) { print FILENAME ":" open[j] ": " j " ended with no spawn record"; delete open[j] } next }
/spawn: \/system\/bin\/[^ ]+ pid=/ { match($0, /spawn: \/system\/bin\/[^ ]+ pid=/); j = substr($0, RSTART + 19, RLENGTH - 24); delete open[j] }
END { flush() }
