import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct RightHipPlate: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 67.1233, y: 0.0000))
            p.addLine(to: CGPoint(x: 28.7671, y: 26.6667))
            p.addLine(to: CGPoint(x: 0.0000, y: 65.0000))
            p.addLine(to: CGPoint(x: 12.3288, y: 81.6667))
            p.addLine(to: CGPoint(x: 63.0137, y: 100.0000))
            p.addLine(to: CGPoint(x: 100.0000, y: 86.6667))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 57.5342, y: 13.3333))
            p.addLine(to: CGPoint(x: 75.3425, y: 75.0000))
            p.addLine(to: CGPoint(x: 46.5753, y: 85.0000))
            p.move(to: CGPoint(x: 68.4932, y: 20.0000))
            p.addLine(to: CGPoint(x: 89.0411, y: 78.3333))
            p.addLine(to: CGPoint(x: 71.2329, y: 90.0000))
            p.move(to: CGPoint(x: 28.7671, y: 35.0000))
            p.addLine(to: CGPoint(x: 12.3288, y: 63.3333))
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
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 28)
    }
}


#Preview {
    RightHipPlate()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
