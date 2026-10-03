import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct LeftCheek: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 0.0000, y: 0.0000))
            p.addQuadCurve(to: CGPoint(x: 75.0000, y: 61.5385), control: CGPoint(x: 50.0000, y: 15.3846))
            p.addLine(to: CGPoint(x: 100.0000, y: 95.3846))
            p.addLine(to: CGPoint(x: 70.8333, y: 100.0000))
            p.addLine(to: CGPoint(x: 25.0000, y: 76.9231))
            p.addLine(to: CGPoint(x: 0.0000, y: 49.2308))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 16.6667, y: 23.0769))
            p.addLine(to: CGPoint(x: 62.5000, y: 64.6154))
            p.addLine(to: CGPoint(x: 79.1667, y: 89.2308))
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
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 5)
    }
}


#Preview {
    LeftCheek()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
