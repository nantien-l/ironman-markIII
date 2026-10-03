import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct RightPalmRepulsor: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 100.0000, y: 10.5263))
            p.addLine(to: CGPoint(x: 37.5000, y: 0.0000))
            p.addLine(to: CGPoint(x: 0.0000, y: 31.5789))
            p.addLine(to: CGPoint(x: 31.2500, y: 89.4737))
            p.addLine(to: CGPoint(x: 81.2500, y: 100.0000))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 68.7500, y: 26.3158))
            p.addLine(to: CGPoint(x: 37.5000, y: 26.3158))
            p.addLine(to: CGPoint(x: 25.0000, y: 47.3684))
            p.addLine(to: CGPoint(x: 50.0000, y: 78.9474))
            p.addLine(to: CGPoint(x: 75.0000, y: 73.6842))
            p.closeSubpath()
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
        SketchPlate(outline: outline, seams: seams, material: .graphite, luminous: light, shading: shade, grain: 44)
    }
}


#Preview {
    RightPalmRepulsor()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
