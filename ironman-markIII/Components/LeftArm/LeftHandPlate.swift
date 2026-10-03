import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct LeftHandPlate: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 5.7143, y: 0.0000))
            p.addLine(to: CGPoint(x: 40.0000, y: 25.4545))
            p.addLine(to: CGPoint(x: 91.4286, y: 43.6364))
            p.addLine(to: CGPoint(x: 100.0000, y: 67.2727))
            p.addLine(to: CGPoint(x: 65.7143, y: 98.1818))
            p.addLine(to: CGPoint(x: 34.2857, y: 100.0000))
            p.addLine(to: CGPoint(x: 0.0000, y: 78.1818))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 11.4286, y: 27.2727))
            p.addLine(to: CGPoint(x: 22.8571, y: 78.1818))
            p.addLine(to: CGPoint(x: 45.7143, y: 87.2727))
            p.addLine(to: CGPoint(x: 82.8571, y: 60.0000))
            p.move(to: CGPoint(x: 25.7143, y: 96.3636))
            p.addLine(to: CGPoint(x: 20.0000, y: 74.5455))
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
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 35)
    }
}


#Preview {
    LeftHandPlate()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
