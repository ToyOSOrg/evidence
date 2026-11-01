# The lid condition: a restatement of earlier "panel lit" sessions

The owner reported on 2026-11-01 that both benches' lids are closed and stay
closed. Linux on both runs `HandleLidSwitch=ignore`. When the lids were
closed is unknown. So every earlier session's "AC, panel lit" setup line
(pr-1131 r1-r4 and #1100's run plans) is withdrawn as a statement of the
physical panel. Those sessions may have been lid-closed, open, or mixed
between sessions.

## What was recorded, and so still stands

**Linux's display, as software holds it.** Every Linux energy run read the
eDP connector's DPMS **On** and the backlight at its setting:

| runs | display | backlight |
|---|---|---|
| T14: #1100 r2 1-4, r7 A0/A1, pr-1131 r3 LE1-3 | `card1-eDP-1:On` | `intel_backlight:6310/19393` |
| AMD: #1100 r2 1-4, pr-1131 r3 LE3 | `card1-eDP-1:On` | `amdgpu_bl1:255/255` |
| T14 r7 A6 (the display-off step) | `Off` | `0` |
| T14 r7 B0 (`nomodeset`) | GOP framebuffer | none |

So no Linux run blanked its panel by software on a closed lid. ToyOS reports
neither lid nor panel. Its display is the GOP's scan-out with the backlight
as firmware left it.

**What a closed lid may still change, unmeasured.** The embedded controller
may cut the backlight or panel power by the lid's own switch, whatever the
OS holds. If it does, it does so under both systems alike. Backlight and
panel power are, by inference, drawn outside the package's RAPL counter. The
package's share of a display is the display engine's state, which each OS's
software sets.

## The conclusions, restated

| conclusion | depends on the panel? | stands as |
|---|---|---|
| APST A/B within ToyOS (r1-r6: idle, excursions, latency) | No. Same system, same session. A lid change mid-session is not excluded, but nothing marks one. | stands |
| The Linux-parity latency gates | No. The disk's path does not depend on the panel. | stands |
| PC2 issue: the display as the GOP left it holds PC2; ToyOS planes-off releases it; Linux display-off (DPMS) saves 418 mW | No. These are the display engine's fetches and DPMS, set by software. | stands |
| ToyOS against Linux idle package (T14 4.3×, AMD +15%, the 6.3 W against 2.8 W baseline, excursions 2-22 against 1-2) | Only through what the EC does on a closed lid, alike for both, and outside RAPL by inference. The display engines differ (Linux's driver against the GOP), which is the known cause. | stands as "same lid, physical state unknown" |

From r6 on, every Linux step records `/proc/acpi/button/lid/*/state`, and
only runs whose lid reads alike are compared.
