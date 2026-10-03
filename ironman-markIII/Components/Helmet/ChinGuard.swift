import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct ChinGuard: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 0.0000, y: 0.0000))
            p.addLine(to: CGPoint(x: 100.0000, y: 0.0000))
            p.addLine(to: CGPoint(x: 88.2353, y: 78.5714))
            p.addLine(to: CGPoint(x: 67.6471, y: 100.0000))
            p.addLine(to: CGPoint(x: 32.3529, y: 100.0000))
            p.addLine(to: CGPoint(x: 11.7647, y: 75.0000))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 14.7059, y: 14.2857))
            p.addLine(to: CGPoint(x: 85.2941, y: 14.2857))
            p.move(to: CGPoint(x: 23.5294, y: 64.2857))
            p.addLine(to: CGPoint(x: 76.4706, y: 64.2857))
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
        SketchPlate(outline: outline, seams: seams, material: .brass, luminous: light, shading: shade, grain: 7)
    }
}


#Preview {
    ChinGuard()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
