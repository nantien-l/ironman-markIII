# Reference tracing revision — 2026-10-03

104 vector components, 57 assembly stages. Rebuilt the front elevation from the supplied drawing, with a registered optional underlay and global plate stacking. Added shoulder pivots, bicep bands, forearm fins, finger armor, collar latches, knee hinges and helmet insets.

Validation:
- Scripts/verify.sh: passed. Unique identities, every part scheduled exactly once, left/right pairing, frame bounds, all body pieces before helmet, faceplate only in final stage, step controls, reset/replay cancellation and delayed online state.
- MarkIII-Verification on iPhone 18 Pro / iOS 27: 2 tests passed, 0 failures. Full playback, pause, reset, backward steps, disabled controls, hidden helmet/faceplate hit testing and reference switch.
- Reviewed phone and compact previews, pre-mask stage and native reference overlay. Main anatomical landmarks register against the supplied drawing; bilateral source asymmetry is normalized.
- Rendered iPhone, iPad, compact and landscape layouts, plus boot/body/pre-mask stages.

Native captures: iphone-simulator.png and reference-overlay.png. The full test output is ui-tests.txt; the state/render summary is state-tests.txt.

The sequence adapts the film's boots-first and final face-seal rhythm to a static front-elevation study. It does not reproduce the film's camera cuts, robotic assembly machinery, or full three-dimensional armor.
