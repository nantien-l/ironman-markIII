import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct RightMiddleProximal: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 100.0000, y: 3.3333))
            p.addLine(to: CGPoint(x: 43.7500, y: 0.0000))
            p.addLine(to: CGPoint(x: 0.0000, y: 83.3333))
            p.addLine(to: CGPoint(x: 50.0000, y: 100.0000))
            p.addLine(to: CGPoint(x: 87.5000, y: 60.0000))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 87.5000, y: 36.6667))
            p.addLine(to: CGPoint(x: 31.2500, y: 26.6667))
            p.move(to: CGPoint(x: 75.0000, y: 66.6667))
            p.addLine(to: CGPoint(x: 12.5000, y: 56.6667))
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
        SketchPlate(outline: outline, seams: seams, material: .brass, luminous: light, shading: shade, grain: 100)
    }
}


#Preview {
    RightMiddleProximal()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
