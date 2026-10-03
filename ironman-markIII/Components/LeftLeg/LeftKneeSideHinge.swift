import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct LeftKneeSideHinge: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 0.0000, y: 0.0000))
            p.addLine(to: CGPoint(x: 92.3077, y: 10.0000))
            p.addLine(to: CGPoint(x: 100.0000, y: 100.0000))
            p.addLine(to: CGPoint(x: 30.7692, y: 100.0000))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 53.8462, y: 20.0000))
            p.addLine(to: CGPoint(x: 53.8462, y: 85.0000))
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
        SketchPlate(outline: outline, seams: seams, material: .graphite, luminous: light, shading: shade, grain: 103)
    }
}


#Preview {
    LeftKneeSideHinge()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
