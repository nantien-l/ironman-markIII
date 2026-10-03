import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct RightKneeCap: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 85.7143, y: 16.9492))
            p.addQuadCurve(to: CGPoint(x: 14.2857, y: 16.9492), control: CGPoint(x: 50.0000, y: 0.0000))
            p.addLine(to: CGPoint(x: 0.0000, y: 45.7627))
            p.addLine(to: CGPoint(x: 32.1429, y: 96.6102))
            p.addLine(to: CGPoint(x: 69.6429, y: 88.1356))
            p.addLine(to: CGPoint(x: 87.5000, y: 100.0000))
            p.addLine(to: CGPoint(x: 100.0000, y: 49.1525))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 91.0714, y: 27.1186))
            p.addQuadCurve(to: CGPoint(x: 17.8571, y: 25.4237), control: CGPoint(x: 55.3571, y: 8.4746))
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
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 65)
    }
}


#Preview {
    RightKneeCap()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
