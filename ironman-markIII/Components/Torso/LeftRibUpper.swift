import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct LeftRibUpper: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 16.9014, y: 0.0000))
            p.addLine(to: CGPoint(x: 47.8873, y: 11.7021))
            p.addLine(to: CGPoint(x: 74.6479, y: 46.8085))
            p.addLine(to: CGPoint(x: 100.0000, y: 100.0000))
            p.addQuadCurve(to: CGPoint(x: 1.4085, y: 53.1915), control: CGPoint(x: 46.4789, y: 81.9149))
            p.addLine(to: CGPoint(x: 0.0000, y: 28.7234))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 7.0423, y: 32.9787))
            p.addQuadCurve(to: CGPoint(x: 84.5070, y: 76.5957), control: CGPoint(x: 46.4789, y: 52.1277))
            p.move(to: CGPoint(x: 4.2254, y: 52.1277))
            p.addQuadCurve(to: CGPoint(x: 97.1831, y: 106.3830), control: CGPoint(x: 45.0704, y: 82.9787))
        }
    }
    private var light: Path {
        Path { p in

        }
    }
    private var shade: Path {
        Path { p in
            p.move(to: CGPoint(x: 1.4085, y: 47.8723))
            p.addLine(to: CGPoint(x: 1.4085, y: 53.1915))
            p.addQuadCurve(to: CGPoint(x: 100.0000, y: 100.0000), control: CGPoint(x: 46.4789, y: 81.9149))
            p.addLine(to: CGPoint(x: 94.3662, y: 91.4894))
            p.addQuadCurve(to: CGPoint(x: 1.4085, y: 47.8723), control: CGPoint(x: 39.4366, y: 73.4043))
            p.closeSubpath()
        }
    }
    var body: some View {
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 17)
    }
}


#Preview {
    LeftRibUpper()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
