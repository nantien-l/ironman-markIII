import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct LeftKneeJoint: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 6.3291, y: 7.1429))
            p.addLine(to: CGPoint(x: 65.8228, y: 0.0000))
            p.addLine(to: CGPoint(x: 96.2025, y: 52.3810))
            p.addLine(to: CGPoint(x: 100.0000, y: 95.2381))
            p.addLine(to: CGPoint(x: 82.2785, y: 95.2381))
            p.addLine(to: CGPoint(x: 72.1519, y: 52.3810))
            p.addQuadCurve(to: CGPoint(x: 21.5190, y: 52.3810), control: CGPoint(x: 44.3038, y: 23.8095))
            p.addLine(to: CGPoint(x: 11.3924, y: 92.8571))
            p.addLine(to: CGPoint(x: 0.0000, y: 100.0000))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 11.3924, y: 16.6667))
            p.addLine(to: CGPoint(x: 65.8228, y: 14.2857))
            p.addLine(to: CGPoint(x: 87.3418, y: 57.1429))
            p.addLine(to: CGPoint(x: 89.8734, y: 92.8571))
        }
    }
    private var light: Path {
        Path { p in

        }
    }
    private var shade: Path {
        Path { p in

        }
    }
    var body: some View {
        SketchPlate(outline: outline, seams: seams, material: .graphite, luminous: light, shading: shade, grain: 51)
    }
}


#Preview {
    LeftKneeJoint()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
