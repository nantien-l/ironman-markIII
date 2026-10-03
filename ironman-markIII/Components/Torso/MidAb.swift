import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct MidAb: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 0.0000, y: 1.1628))
            p.addQuadCurve(to: CGPoint(x: 100.0000, y: 0.0000), control: CGPoint(x: 50.3759, y: 58.1395))
            p.addLine(to: CGPoint(x: 93.2331, y: 56.9767))
            p.addQuadCurve(to: CGPoint(x: 7.5188, y: 59.3023), control: CGPoint(x: 50.3759, y: 100.0000))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 7.5188, y: 58.1395))
            p.addQuadCurve(to: CGPoint(x: 93.2331, y: 56.9767), control: CGPoint(x: 48.8722, y: 95.3488))
        }
    }
    private var light: Path {
        Path { p in

        }
    }
    private var shade: Path {
        Path { p in
            p.move(to: CGPoint(x: 7.5188, y: 53.4884))
            p.addQuadCurve(to: CGPoint(x: 93.2331, y: 51.1628), control: CGPoint(x: 50.3759, y: 93.0233))
            p.addLine(to: CGPoint(x: 93.2331, y: 56.9767))
            p.addQuadCurve(to: CGPoint(x: 7.5188, y: 59.3023), control: CGPoint(x: 50.3759, y: 100.0000))
            p.closeSubpath()
        }
    }
    var body: some View {
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 22)
    }
}


#Preview {
    MidAb()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
