# name w h wmm hmm -> mutter-rule scale over quarter steps 1..4 with a 600x600 logical floor,
# with and without mutter's "divides the screen" filter
function pick(w,h,wmm,hmm,div,   diag_in,dpi,tgt,perfect,best,berr,q,s,e,ok) {
  diag_in = sqrt(wmm*wmm+hmm*hmm)/25.4
  tgt = (diag_in < 20) ? 135 : 110
  dpi = sqrt(w*w+h*h)/diag_in
  perfect = dpi/tgt
  best=1; berr=-1
  for (q=4; q<=16; q++) {
    s=q/4
    if (int(w/s)*int(h/s) < 360000) continue
    if (div && (((w*4)%q)!=0 || ((h*4)%q)!=0)) continue
    e = perfect-s; if (e<0) e=-e
    if (berr<0 || e<berr) { best=s; berr=e }
  }
  return sprintf("diag=%.2fin dpi=%.1f target=%d perfect=%.3f -> %s", diag_in, dpi, tgt, perfect, best)
}
{ printf "%-34s %s | mutter-divisible: %s\n", $1, pick($2,$3,$4,$5,0), substr(pick($2,$3,$4,$5,1), index(pick($2,$3,$4,$5,1),"->")+3) }
