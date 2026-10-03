import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct RightForearmOuter: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 77.4648, y: 0.0000))
            p.addLine(to: CGPoint(x: 59.1549, y: 16.5563))
            p.addQuadCurve(to: CGPoint(x: 0.0000, y: 17.2185), control: CGPoint(x: 36.6197, y: 29.1391))
            p.addLine(to: CGPoint(x: 2.8169, y: 43.0464))
            p.addQuadCurve(to: CGPoint(x: 38.0282, y: 93.3775), control: CGPoint(x: 12.6761, y: 73.5099))
            p.addLine(to: CGPoint(x: 61.9718, y: 100.0000))
            p.addLine(to: CGPoint(x: 100.0000, y: 83.4437))
            p.addLine(to: CGPoint(x: 100.0000, y: 45.6954))
            p.addLine(to: CGPoint(x: 91.5493, y: 23.8411))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 64.7887, y: 28.4768))
            p.addLine(to: CGPoint(x: 66.1972, y: 56.2914))
            p.addQuadCurve(to: CGPoint(x: 56.3380, y: 93.3775), control: CGPoint(x: 64.7887, y: 78.1457))
            p.move(to: CGPoint(x: 5.6338, y: 33.7748))
            p.addQuadCurve(to: CGPoint(x: 43.6620, y: 90.0662), control: CGPoint(x: 18.3099, y: 72.8477))
        }
    }
    private var light: Path {
        Path { p in

        }
    }
    private var shade: Path {
        Path { p in
            p.move(to: CGPoint(x: 4.2254, y: 21.8543))
            p.addLine(to: CGPoint(x: 2.8169, y: 43.0464))
            p.addQuadCurve(to: CGPoint(x: 38.0282, y: 93.3775), control: CGPoint(x: 12.6761, y: 73.5099))
            p.addLine(to: CGPoint(x: 61.9718, y: 100.0000))
            p.addLine(to: CGPoint(x: 64.7887, y: 96.0265))
            p.addLine(to: CGPoint(x: 43.6620, y: 90.0662))
            p.addQuadCurve(to: CGPoint(x: 9.8592, y: 39.7351), control: CGPoint(x: 15.4930, y: 67.5497))
            p.closeSubpath()
        }
    }
    var body: some View {
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 41)
    }
}


#Preview {
    RightForearmOuter()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
