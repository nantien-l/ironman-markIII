import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct UpperAb: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 20.3008, y: 5.0847))
            p.addQuadCurve(to: CGPoint(x: 79.6992, y: 5.0847), control: CGPoint(x: 50.3759, y: 0.0000))
            p.addLine(to: CGPoint(x: 100.0000, y: 49.1525))
            p.addQuadCurve(to: CGPoint(x: 50.3759, y: 100.0000), control: CGPoint(x: 87.9699, y: 100.0000))
            p.addQuadCurve(to: CGPoint(x: 0.0000, y: 55.9322), control: CGPoint(x: 17.2932, y: 100.0000))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 9.7744, y: 25.4237))
            p.addQuadCurve(to: CGPoint(x: 90.2256, y: 25.4237), control: CGPoint(x: 50.3759, y: 57.6271))
        }
    }
    private var light: Path {
        Path { p in

        }
    }
    private var shade: Path {
        Path { p in
            p.move(to: CGPoint(x: 0.0000, y: 55.9322))
            p.addQuadCurve(to: CGPoint(x: 50.3759, y: 100.0000), control: CGPoint(x: 17.2932, y: 100.0000))
            p.addQuadCurve(to: CGPoint(x: 100.0000, y: 49.1525), control: CGPoint(x: 87.9699, y: 100.0000))
            p.addLine(to: CGPoint(x: 95.4887, y: 52.5424))
            p.addQuadCurve(to: CGPoint(x: 50.3759, y: 93.2203), control: CGPoint(x: 81.9549, y: 93.2203))
            p.addQuadCurve(to: CGPoint(x: 5.2632, y: 55.9322), control: CGPoint(x: 18.7970, y: 93.2203))
            p.closeSubpath()
        }
    }
    var body: some View {
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 21)
    }
}


#Preview {
    UpperAb()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
