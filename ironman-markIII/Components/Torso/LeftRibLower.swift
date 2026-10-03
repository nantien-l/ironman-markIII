import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct LeftRibLower: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 0.0000, y: 0.0000))
            p.addQuadCurve(to: CGPoint(x: 100.0000, y: 64.1975), control: CGPoint(x: 42.8571, y: 40.7407))
            p.addLine(to: CGPoint(x: 67.1429, y: 100.0000))
            p.addLine(to: CGPoint(x: 30.0000, y: 92.5926))
            p.addQuadCurve(to: CGPoint(x: 0.0000, y: 29.6296), control: CGPoint(x: 7.1429, y: 58.0247))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 1.4286, y: 20.9877))
            p.addQuadCurve(to: CGPoint(x: 82.8571, y: 74.0741), control: CGPoint(x: 38.5714, y: 58.0247))
            p.move(to: CGPoint(x: 10.0000, y: 54.3210))
            p.addLine(to: CGPoint(x: 42.8571, y: 82.7160))
            p.addLine(to: CGPoint(x: 64.2857, y: 93.8272))
        }
    }
    private var light: Path {
        Path { p in

        }
    }
    private var shade: Path {
        Path { p in
            p.move(to: CGPoint(x: 4.2857, y: 43.2099))
            p.addLine(to: CGPoint(x: 30.0000, y: 92.5926))
            p.addLine(to: CGPoint(x: 67.1429, y: 100.0000))
            p.addLine(to: CGPoint(x: 74.2857, y: 91.3580))
            p.addLine(to: CGPoint(x: 31.4286, y: 86.4198))
            p.closeSubpath()
        }
    }
    var body: some View {
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 19)
    }
}


#Preview {
    LeftRibLower()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
