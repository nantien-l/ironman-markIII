import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct RightIndexProximal: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 100.0000, y: 4.5455))
            p.addLine(to: CGPoint(x: 25.0000, y: 0.0000))
            p.addLine(to: CGPoint(x: 0.0000, y: 68.1818))
            p.addLine(to: CGPoint(x: 62.5000, y: 100.0000))
            p.addLine(to: CGPoint(x: 87.5000, y: 63.6364))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 81.2500, y: 31.8182))
            p.addLine(to: CGPoint(x: 18.7500, y: 31.8182))
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
        SketchPlate(outline: outline, seams: seams, material: .brass, luminous: light, shading: shade, grain: 96)
    }
}


#Preview {
    RightIndexProximal()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
