/^[0-9a-f]+ <.*>:$/ { fn=$0; sub(/^[0-9a-f]+ </,"",fn); sub(/>:$/,"",fn); sub(/ \(\.llvm\.[0-9]+\)$/,"",fn); next }
/^ *[0-9a-f]+:[ \t]+/ {
  line=$0; sub(/^ *[0-9a-f]+:[ \t]+/,"",line);
  n=split(line, parts, /\t/); m=parts[1]; ops=parts[2];
  if (m ~ /^(rep|repne|lock|data16|cs|ds|es|ss|fs|gs)$/ || m ~ /^(rep|lock) /) { split(ops, more, /[ \t]+/); m=more[1] }
  vec = (ops ~ /(^|[^a-z])(xmm|ymm|zmm)[0-9]+([^0-9a-z]|$)/) || (ops ~ /(^|[^a-z])mm[0-7]([^0-9a-z]|$)/) || (ops ~ /(^|[^a-z])st\(/) || (ops ~ /(^|[^a-z])k[0-7]([^0-9a-z]|$)/) || (ops ~ /(^|[^a-z])tmm[0-7]/);
  st = (m ~ /^(xsave|xrstor|fxsave|fxrstor|f|wait|emms|ldmxcsr|stmxcsr|vzero|vldmxcsr|vstmxcsr|tilerelease|ldtilecfg|sttilecfg)/);
  total++;
  if (vec || st) { print m "\t" fn }
}
END { print "TOTAL\t" total > "/dev/stderr" }
