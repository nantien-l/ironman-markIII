import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct LeftElbowJoint: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 23.9437, y: 0.0000))
            p.addLine(to: CGPoint(x: 94.3662, y: 13.6364))
            p.addQuadCurve(to: CGPoint(x: 74.6479, y: 71.2121), control: CGPoint(x: 100.0000, y: 43.9394))
            p.addQuadCurve(to: CGPoint(x: 15.4930, y: 71.2121), control: CGPoint(x: 46.4789, y: 100.0000))
            p.addQuadCurve(to: CGPoint(x: 23.9437, y: 0.0000), control: CGPoint(x: 0.0000, y: 45.4545))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 19.7183, y: 21.2121))
            p.addQuadCurve(to: CGPoint(x: 88.7324, y: 42.4242), control: CGPoint(x: 50.7042, y: 13.6364))
            p.move(to: CGPoint(x: 15.4930, y: 31.8182))
            p.addQuadCurve(to: CGPoint(x: 87.3239, y: 51.5152), control: CGPoint(x: 50.7042, y: 24.2424))
            p.move(to: CGPoint(x: 12.6761, y: 43.9394))
            p.addQuadCurve(to: CGPoint(x: 80.2817, y: 60.6061), control: CGPoint(x: 42.2535, y: 36.3636))
            p.move(to: CGPoint(x: 18.3099, y: 57.5758))
            p.addQuadCurve(to: CGPoint(x: 74.6479, y: 69.6970), control: CGPoint(x: 43.6620, y: 46.9697))
            p.move(to: CGPoint(x: 25.0000, y: 10.0000))
            p.addQuadCurve(to: CGPoint(x: 84.0000, y: 25.0000), control: CGPoint(x: 54.0000, y: 5.0000))
            p.move(to: CGPoint(x: 21.0000, y: 49.0000))
            p.addQuadCurve(to: CGPoint(x: 77.0000, y: 63.0000), control: CGPoint(x: 47.0000, y: 40.0000))
            p.addLine(to: CGPoint(x: 68.0000, y: 70.0000))
            p.move(to: CGPoint(x: 44.0000, y: 18.0000))
            p.addLine(to: CGPoint(x: 40.0000, y: 62.0000))
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
        SketchPlate(outline: outline, seams: seams, material: .graphite, luminous: light, shading: shade, grain: 32)
    }
}


#Preview {
    LeftElbowJoint()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
