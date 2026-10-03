import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct LowerAb: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 0.0000, y: 0.0000))
            p.addQuadCurve(to: CGPoint(x: 100.0000, y: 0.0000), control: CGPoint(x: 50.0000, y: 50.0000))
            p.addLine(to: CGPoint(x: 97.3684, y: 48.4848))
            p.addQuadCurve(to: CGPoint(x: 2.6316, y: 50.0000), control: CGPoint(x: 50.8772, y: 100.0000))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 4.3860, y: 50.0000))
            p.addQuadCurve(to: CGPoint(x: 95.6140, y: 50.0000), control: CGPoint(x: 50.0000, y: 92.4242))
        }
    }
    private var light: Path {
        Path { p in

        }
    }
    private var shade: Path {
        Path { p in
            p.move(to: CGPoint(x: 2.6316, y: 42.4242))
            p.addQuadCurve(to: CGPoint(x: 97.3684, y: 40.9091), control: CGPoint(x: 50.8772, y: 93.9394))
            p.addLine(to: CGPoint(x: 97.3684, y: 48.4848))
            p.addQuadCurve(to: CGPoint(x: 2.6316, y: 50.0000), control: CGPoint(x: 50.8772, y: 100.0000))
            p.closeSubpath()
        }
    }
    var body: some View {
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 23)
    }
}


#Preview {
    LowerAb()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
