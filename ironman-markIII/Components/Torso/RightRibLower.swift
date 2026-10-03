import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct RightRibLower: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 100.0000, y: 0.0000))
            p.addQuadCurve(to: CGPoint(x: 0.0000, y: 64.1975), control: CGPoint(x: 57.1429, y: 40.7407))
            p.addLine(to: CGPoint(x: 32.8571, y: 100.0000))
            p.addLine(to: CGPoint(x: 70.0000, y: 92.5926))
            p.addQuadCurve(to: CGPoint(x: 100.0000, y: 29.6296), control: CGPoint(x: 92.8571, y: 58.0247))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 98.5714, y: 20.9877))
            p.addQuadCurve(to: CGPoint(x: 17.1429, y: 74.0741), control: CGPoint(x: 61.4286, y: 58.0247))
            p.move(to: CGPoint(x: 90.0000, y: 54.3210))
            p.addLine(to: CGPoint(x: 57.1429, y: 82.7160))
            p.addLine(to: CGPoint(x: 35.7143, y: 93.8272))
        }
    }
    private var light: Path {
        Path { p in

        }
    }
    private var shade: Path {
        Path { p in
            p.move(to: CGPoint(x: 95.7143, y: 43.2099))
            p.addLine(to: CGPoint(x: 70.0000, y: 92.5926))
            p.addLine(to: CGPoint(x: 32.8571, y: 100.0000))
            p.addLine(to: CGPoint(x: 25.7143, y: 91.3580))
            p.addLine(to: CGPoint(x: 68.5714, y: 86.4198))
            p.closeSubpath()
        }
    }
    var body: some View {
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 20)
    }
}


#Preview {
    RightRibLower()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
