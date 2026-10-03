import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct RightHandPlate: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 94.2857, y: 0.0000))
            p.addLine(to: CGPoint(x: 60.0000, y: 25.4545))
            p.addLine(to: CGPoint(x: 8.5714, y: 43.6364))
            p.addLine(to: CGPoint(x: 0.0000, y: 67.2727))
            p.addLine(to: CGPoint(x: 34.2857, y: 98.1818))
            p.addLine(to: CGPoint(x: 65.7143, y: 100.0000))
            p.addLine(to: CGPoint(x: 100.0000, y: 78.1818))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 88.5714, y: 27.2727))
            p.addLine(to: CGPoint(x: 77.1429, y: 78.1818))
            p.addLine(to: CGPoint(x: 54.2857, y: 87.2727))
            p.addLine(to: CGPoint(x: 17.1429, y: 60.0000))
            p.move(to: CGPoint(x: 74.2857, y: 96.3636))
            p.addLine(to: CGPoint(x: 80.0000, y: 74.5455))
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
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 43)
    }
}


#Preview {
    RightHandPlate()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
