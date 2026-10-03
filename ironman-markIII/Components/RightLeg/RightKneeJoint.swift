import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct RightKneeJoint: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 93.6709, y: 7.1429))
            p.addLine(to: CGPoint(x: 34.1772, y: 0.0000))
            p.addLine(to: CGPoint(x: 3.7975, y: 52.3810))
            p.addLine(to: CGPoint(x: 0.0000, y: 95.2381))
            p.addLine(to: CGPoint(x: 17.7215, y: 95.2381))
            p.addLine(to: CGPoint(x: 27.8481, y: 52.3810))
            p.addQuadCurve(to: CGPoint(x: 78.4810, y: 52.3810), control: CGPoint(x: 55.6962, y: 23.8095))
            p.addLine(to: CGPoint(x: 88.6076, y: 92.8571))
            p.addLine(to: CGPoint(x: 100.0000, y: 100.0000))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 88.6076, y: 16.6667))
            p.addLine(to: CGPoint(x: 34.1772, y: 14.2857))
            p.addLine(to: CGPoint(x: 12.6582, y: 57.1429))
            p.addLine(to: CGPoint(x: 10.1266, y: 92.8571))
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
        SketchPlate(outline: outline, seams: seams, material: .graphite, luminous: light, shading: shade, grain: 66)
    }
}


#Preview {
    RightKneeJoint()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
