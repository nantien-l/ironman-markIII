import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct LeftWaist: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 0.0000, y: 0.0000))
            p.addLine(to: CGPoint(x: 58.3333, y: 9.4118))
            p.addLine(to: CGPoint(x: 94.4444, y: 63.5294))
            p.addLine(to: CGPoint(x: 100.0000, y: 100.0000))
            p.addLine(to: CGPoint(x: 44.4444, y: 91.7647))
            p.addLine(to: CGPoint(x: 22.2222, y: 84.7059))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 22.2222, y: 5.8824))
            p.addLine(to: CGPoint(x: 50.0000, y: 41.1765))
            p.addLine(to: CGPoint(x: 69.4444, y: 95.2941))
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
        SketchPlate(outline: outline, seams: seams, material: .brass, luminous: light, shading: shade, grain: 24)
    }
}


#Preview {
    LeftWaist()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
