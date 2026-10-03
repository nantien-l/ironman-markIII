import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct LeftForearmOuter: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 22.5352, y: 0.0000))
            p.addLine(to: CGPoint(x: 40.8451, y: 16.5563))
            p.addQuadCurve(to: CGPoint(x: 100.0000, y: 17.2185), control: CGPoint(x: 63.3803, y: 29.1391))
            p.addLine(to: CGPoint(x: 97.1831, y: 43.0464))
            p.addQuadCurve(to: CGPoint(x: 61.9718, y: 93.3775), control: CGPoint(x: 87.3239, y: 73.5099))
            p.addLine(to: CGPoint(x: 38.0282, y: 100.0000))
            p.addLine(to: CGPoint(x: 0.0000, y: 83.4437))
            p.addLine(to: CGPoint(x: 0.0000, y: 45.6954))
            p.addLine(to: CGPoint(x: 8.4507, y: 23.8411))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 35.2113, y: 28.4768))
            p.addLine(to: CGPoint(x: 33.8028, y: 56.2914))
            p.addQuadCurve(to: CGPoint(x: 43.6620, y: 93.3775), control: CGPoint(x: 35.2113, y: 78.1457))
            p.move(to: CGPoint(x: 94.3662, y: 33.7748))
            p.addQuadCurve(to: CGPoint(x: 56.3380, y: 90.0662), control: CGPoint(x: 81.6901, y: 72.8477))
        }
    }
    private var light: Path {
        Path { p in

        }
    }
    private var shade: Path {
        Path { p in
            p.move(to: CGPoint(x: 95.7746, y: 21.8543))
            p.addLine(to: CGPoint(x: 97.1831, y: 43.0464))
            p.addQuadCurve(to: CGPoint(x: 61.9718, y: 93.3775), control: CGPoint(x: 87.3239, y: 73.5099))
            p.addLine(to: CGPoint(x: 38.0282, y: 100.0000))
            p.addLine(to: CGPoint(x: 35.2113, y: 96.0265))
            p.addLine(to: CGPoint(x: 56.3380, y: 90.0662))
            p.addQuadCurve(to: CGPoint(x: 90.1408, y: 39.7351), control: CGPoint(x: 84.5070, y: 67.5497))
            p.closeSubpath()
        }
    }
    var body: some View {
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 33)
    }
}


#Preview {
    LeftForearmOuter()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
