import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct LeftBicepUpperBand: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 6.1538, y: 50.9804))
            p.addQuadCurve(to: CGPoint(x: 69.2308, y: 27.4510), control: CGPoint(x: 30.7692, y: 0.0000))
            p.addQuadCurve(to: CGPoint(x: 100.0000, y: 84.3137), control: CGPoint(x: 95.3846, y: 41.1765))
            p.addLine(to: CGPoint(x: 61.5385, y: 100.0000))
            p.addLine(to: CGPoint(x: 0.0000, y: 78.4314))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 3.0769, y: 72.5490))
            p.addLine(to: CGPoint(x: 61.5385, y: 90.1961))
            p.addLine(to: CGPoint(x: 96.9231, y: 76.4706))
        }
    }
    private var light: Path {
        Path { p in

        }
    }
    private var shade: Path {
        Path { p in
            p.move(to: CGPoint(x: 0.0000, y: 70.5882))
            p.addLine(to: CGPoint(x: 61.5385, y: 90.1961))
            p.addLine(to: CGPoint(x: 100.0000, y: 74.5098))
            p.addLine(to: CGPoint(x: 100.0000, y: 84.3137))
            p.addLine(to: CGPoint(x: 61.5385, y: 100.0000))
            p.addLine(to: CGPoint(x: 0.0000, y: 78.4314))
            p.closeSubpath()
        }
    }
    var body: some View {
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 81)
    }
}


#Preview {
    LeftBicepUpperBand()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
