# ToyOS's own auto-scale rule as PR #895 round 2 states it.
# Input per row: name width height width_mm height_mm.
# The logical pixel is CSS Values 3 section 5.2's reference pixel: the visual angle of 1/96 in at 28 in.
# Assumed viewing distance: 28 in for a panel of 20 in diagonal or more, 22 in below it.
# A panel's density is held to the reference pixel at that distance: target = 96 * 28 / distance dpi.
# Scale = the quarter step from 1 to 4 nearest density/target, stepped down until the logical
# screen holds 642x446 (an 80x24 terminal of 8x16 cells in Chrome::DEFAULT's frame, over the taskbar).
function pick(w,h,wmm,hmm,   diag,dist,tgt,dpi,ideal,q,s,best,berr,e) {
  diag = sqrt(wmm*wmm+hmm*hmm)/25.4
  dist = (diag >= 20) ? 28 : 22
  tgt = 96*28/dist
  dpi = sqrt(w*w+h*h)/diag
  ideal = dpi/tgt
  best = 1; berr = -1
  for (q = 4; q <= 16; q++) {
    s = q/4
    if (w/s < 642 || h/s < 446) continue
    e = ideal - s; if (e < 0) e = -e
    if (berr < 0 || e < berr - 1e-9) { best = s; berr = e }
  }
  return sprintf("diag=%5.2fin dist=%din target=%6.2fdpi dpi=%6.1f ideal=%5.3f -> %s  logical=%dx%d", diag, dist, tgt, dpi, ideal, best, int(w/best+0.5), int(h/best+0.5))
}
/^#/ { print; next }
NF == 5 { printf "%-34s %s\n", $1, pick($2,$3,$4,$5) }
