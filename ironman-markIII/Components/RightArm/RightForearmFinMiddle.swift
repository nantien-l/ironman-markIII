import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct RightForearmFinMiddle: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 89.2857, y: 0.0000))
            p.addLine(to: CGPoint(x: 0.0000, y: 65.6250))
            p.addLine(to: CGPoint(x: 50.0000, y: 100.0000))
            p.addLine(to: CGPoint(x: 100.0000, y: 65.6250))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in

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
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 88)
    }
}


#Preview {
    RightForearmFinMiddle()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
