import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct RightAnkleGuard: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 85.0000, y: 12.0000))
            p.addLine(to: CGPoint(x: 53.3333, y: 0.0000))
            p.addLine(to: CGPoint(x: 20.0000, y: 4.0000))
            p.addLine(to: CGPoint(x: 0.0000, y: 16.0000))
            p.addLine(to: CGPoint(x: 3.3333, y: 100.0000))
            p.addLine(to: CGPoint(x: 100.0000, y: 100.0000))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 56.6667, y: 8.0000))
            p.addLine(to: CGPoint(x: 70.0000, y: 94.0000))
            p.move(to: CGPoint(x: 20.0000, y: 12.0000))
            p.addLine(to: CGPoint(x: 18.3333, y: 96.0000))
        }
    }
    private var light: Path {
        Path { p in

        }
    }
    private var shade: Path {
        Path { p in
            p.move(to: CGPoint(x: 85.0000, y: 12.0000))
            p.addLine(to: CGPoint(x: 76.6667, y: 8.0000))
            p.addLine(to: CGPoint(x: 90.0000, y: 96.0000))
            p.addLine(to: CGPoint(x: 100.0000, y: 100.0000))
            p.closeSubpath()
        }
    }
    var body: some View {
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 71)
    }
}


#Preview {
    RightAnkleGuard()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
