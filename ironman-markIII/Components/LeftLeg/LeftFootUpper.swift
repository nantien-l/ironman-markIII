import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct LeftFootUpper: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 8.4507, y: 0.0000))
            p.addQuadCurve(to: CGPoint(x: 92.9577, y: 0.0000), control: CGPoint(x: 50.7042, y: 17.0732))
            p.addLine(to: CGPoint(x: 100.0000, y: 65.8537))
            p.addLine(to: CGPoint(x: 78.8732, y: 100.0000))
            p.addLine(to: CGPoint(x: 25.3521, y: 100.0000))
            p.addLine(to: CGPoint(x: 0.0000, y: 73.1707))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 7.0423, y: 17.0732))
            p.addLine(to: CGPoint(x: 35.2113, y: 24.3902))
            p.addLine(to: CGPoint(x: 76.0563, y: 24.3902))
            p.addLine(to: CGPoint(x: 94.3662, y: 14.6341))
            p.move(to: CGPoint(x: 33.8028, y: 21.9512))
            p.addLine(to: CGPoint(x: 29.5775, y: 78.0488))
            p.addLine(to: CGPoint(x: 78.8732, y: 78.0488))
            p.addLine(to: CGPoint(x: 76.0563, y: 21.9512))
            p.move(to: CGPoint(x: 2.8169, y: 65.8537))
            p.addLine(to: CGPoint(x: 29.5775, y: 78.0488))
            p.move(to: CGPoint(x: 78.8732, y: 78.0488))
            p.addLine(to: CGPoint(x: 97.1831, y: 65.8537))
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
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 57)
    }
}


#Preview {
    LeftFootUpper()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
