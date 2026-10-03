import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct RightKneeSideHinge: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 100.0000, y: 0.0000))
            p.addLine(to: CGPoint(x: 7.6923, y: 10.0000))
            p.addLine(to: CGPoint(x: 0.0000, y: 100.0000))
            p.addLine(to: CGPoint(x: 69.2308, y: 100.0000))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 46.1538, y: 20.0000))
            p.addLine(to: CGPoint(x: 46.1538, y: 85.0000))
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
        SketchPlate(outline: outline, seams: seams, material: .graphite, luminous: light, shading: shade, grain: 104)
    }
}


#Preview {
    RightKneeSideHinge()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
