import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct RightShinOuter: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 100.0000, y: 0.0000))
            p.addLine(to: CGPoint(x: 9.3750, y: 52.0833))
            p.addLine(to: CGPoint(x: 0.0000, y: 93.7500))
            p.addLine(to: CGPoint(x: 62.5000, y: 100.0000))
            p.addLine(to: CGPoint(x: 81.2500, y: 75.0000))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 81.2500, y: 20.8333))
            p.addLine(to: CGPoint(x: 56.2500, y: 84.3750))
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
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 69)
    }
}


#Preview {
    RightShinOuter()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
