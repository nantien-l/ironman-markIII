import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct HelmetCrown: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 1.0526, y: 45.0980))
            p.addLine(to: CGPoint(x: 1.0526, y: 29.4118))
            p.addQuadCurve(to: CGPoint(x: 43.1579, y: 3.9216), control: CGPoint(x: 3.1579, y: 4.5752))
            p.addQuadCurve(to: CGPoint(x: 98.9474, y: 26.1438), control: CGPoint(x: 94.7368, y: 0.0000))
            p.addLine(to: CGPoint(x: 100.0000, y: 66.6667))
            p.addLine(to: CGPoint(x: 89.4737, y: 79.7386))
            p.addLine(to: CGPoint(x: 82.1053, y: 92.1569))
            p.addLine(to: CGPoint(x: 70.5263, y: 100.0000))
            p.addLine(to: CGPoint(x: 30.5263, y: 100.0000))
            p.addLine(to: CGPoint(x: 15.7895, y: 90.1961))
            p.addLine(to: CGPoint(x: 7.3684, y: 77.7778))
            p.addLine(to: CGPoint(x: 0.0000, y: 66.6667))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 6.3158, y: 45.7516))
            p.addLine(to: CGPoint(x: 7.3684, y: 25.4902))
            p.addQuadCurve(to: CGPoint(x: 35.7895, y: 8.4967), control: CGPoint(x: 11.5789, y: 9.1503))
            p.move(to: CGPoint(x: 65.2632, y: 7.8431))
            p.addQuadCurve(to: CGPoint(x: 93.6842, y: 26.1438), control: CGPoint(x: 92.6316, y: 7.8431))
            p.addLine(to: CGPoint(x: 94.7368, y: 45.0980))
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
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 1)
    }
}


#Preview {
    HelmetCrown()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
