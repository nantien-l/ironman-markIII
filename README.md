# Mark III — reference-registered engineering drawing

A native SwiftUI front elevation with **104 independent vector components**, assembled as a continuous laser trace. The user's three-view drawing is available as a switchable tracing underlay. The finished armor itself is drawn entirely with vector paths.

## Run

Open `ironman-markIII.xcodeproj`, select the `ironman-markIII` scheme and an iPhone or iPad simulator, then Run. **Play All** starts at the boots and builds upward through legs, torso and arms. The neck and helmet follow the completed body. The faceplate closes in the final stage; illumination waits for the seal to finish. Playback takes about 37 seconds including initialization.

**對照底圖** switches on the registered reference beneath the vectors. The drawing becomes translucent so the original contours can be compared directly. Reset, Previous, Next and Pause work throughout playback. The counter reports installed components, so most paired stages advance it by two. Previous from completion removes the faceplate and its two inset pieces and turns off the lights.

Debug launch argument `--assembled` opens the completed drawing. Normal launches start empty.

## Geometry

- Helmet 10; torso 22; arms 20 each; legs 16 each.
- `Scripts/TraceReference.py` stores the measured front-elevation curves, seams, folds and local relief. Running it regenerates the component files and regional placement maps. Edit those measurements when revising the drawing; generated files are marked accordingly.
- Each component owns its local 0–100 vector paths. All placement derives from one reference registration: `x = 195 + (referenceX - 435) × 0.6`, `y = 40 + (referenceY - 116) × 0.6`, using the displayed 1887-pixel reference width.
- The original 1900 × 1342 GIF is converted losslessly to PNG for the asset catalog. The underlay scales to that same registration and clips out the side/back elevations. It is hidden by default and excluded from the animated armor.
- The front view uses bilateral symmetry. Small left/right differences in the source are intentionally normalized; side and rear views remain in the guide asset but are not separate rendered armor views.
- The 390 × 760 drawing sheet scales uniformly to fit available width and height.

## Animation

`AssemblyPart.number` is a stable identity, not a playback index. `SuitUpSequence.beats` defines the mechanical grouping, while `orderedParts` expands it into 104 sequential laser nodes. Draw order is global across regions, so shoulder pivots, collar pieces and hip connections overlap correctly.

The choreography follows the broad Mark III workshop rhythm of boots first, body completion, reactor seat, and helmet/face seal last, adapted to a stationary front-elevation drawing rather than a shot-for-shot recreation with robotic arms and camera cuts. Each component draws its actual contour with a short glowing laser head; the next contour starts immediately after the previous one finishes. The faceplate has a separate final seal. Technical annotations remain hidden until the armor is complete, then their construction lines are revealed with the same trim sweep. Reduced Motion suppresses the sweep while preserving order.

`Audio/ironman.m4a` is bundled with the app. Normal playback maps the 57 assembly beats to its active duration, keeps its short tail clear for the reactor and eye reveal, and pauses or resets the audio with the corresponding controls. Fast state verification deliberately uses its injected test clock instead of audio duration.

## Verification

`Scripts/verify.sh` checks every component's identity, scheduling exactly once, bilateral pairing, frame bounds, body-before-helmet ordering, final face seal, state transitions and cancellation. It renders four screen sizes plus boots-only, body-complete and pre-mask stages into `Verification`.

Native UI coverage lives in `UITests/AssemblyUITests.swift`, including full playback, controls, hidden helmet/mask hit testing and reference overlay switching:

```sh
DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer xcodebuild test \
  -scheme MarkIII-Verification \
  -destination 'platform=iOS Simulator,name=iPhone 18 Pro' \
  -derivedDataPath /tmp/markiii-build CODE_SIGNING_ALLOWED=NO
```

Both verification paths require macOS and full Xcode. Generated verification images are not bundled in the app.
