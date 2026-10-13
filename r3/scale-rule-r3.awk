# ToyOS's own auto-scale rule as PR #895 round 3 states it. Input per row: name width height width_mm height_mm.
# The logical pixel is CSS Values 3 section 5.2's reference pixel: the visual angle of 1/96 in at 28 in.
# One assumed viewing distance for every panel, 24 in, so the target density is 96 * 28 / 24 = 112 dpi.
# Scale = the quarter step from 1 to 4 nearest density/112, stepped down until the logical screen
# holds 642x446 (an 80x24 terminal of 8x16 cells in Chrome::DEFAULT's frame, over the taskbar).
# One target makes the scale a non-decreasing function of density alone.
function pick(w,h,wmm,hmm,   diag,tgt,dpi,ideal,q,s,best,berr,e) {
  diag = sqrt(wmm*wmm+hmm*hmm)/25.4
  tgt = 96*28/24
  dpi = sqrt(w*w+h*h)/diag
  ideal = dpi/tgt
  best = 1; berr = -1
  for (q = 4; q <= 16; q++) {
    s = q/4
    if (w/s < 642 || h/s < 446) continue
    e = ideal - s; if (e < 0) e = -e
    if (berr < 0 || e < berr - 1e-9) { best = s; berr = e }
  }
  return sprintf("diag=%5.2fin dpi=%6.1f ideal=%5.3f -> %s  logical=%dx%d", diag, dpi, ideal, best, int(w/best+0.5), int(h/best+0.5))
}
/^#/ { print; next }
NF == 5 { printf "%-36s %s\n", $1, pick($2,$3,$4,$5) }
