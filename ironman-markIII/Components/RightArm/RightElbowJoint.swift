import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct RightElbowJoint: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 76.0563, y: 0.0000))
            p.addLine(to: CGPoint(x: 5.6338, y: 13.6364))
            p.addQuadCurve(to: CGPoint(x: 25.3521, y: 71.2121), control: CGPoint(x: 0.0000, y: 43.9394))
            p.addQuadCurve(to: CGPoint(x: 84.5070, y: 71.2121), control: CGPoint(x: 53.5211, y: 100.0000))
            p.addQuadCurve(to: CGPoint(x: 76.0563, y: 0.0000), control: CGPoint(x: 100.0000, y: 45.4545))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 80.2817, y: 21.2121))
            p.addQuadCurve(to: CGPoint(x: 11.2676, y: 42.4242), control: CGPoint(x: 49.2958, y: 13.6364))
            p.move(to: CGPoint(x: 84.5070, y: 31.8182))
            p.addQuadCurve(to: CGPoint(x: 12.6761, y: 51.5152), control: CGPoint(x: 49.2958, y: 24.2424))
            p.move(to: CGPoint(x: 87.3239, y: 43.9394))
            p.addQuadCurve(to: CGPoint(x: 19.7183, y: 60.6061), control: CGPoint(x: 57.7465, y: 36.3636))
            p.move(to: CGPoint(x: 81.6901, y: 57.5758))
            p.addQuadCurve(to: CGPoint(x: 25.3521, y: 69.6970), control: CGPoint(x: 56.3380, y: 46.9697))
            p.move(to: CGPoint(x: 75.0000, y: 10.0000))
            p.addQuadCurve(to: CGPoint(x: 16.0000, y: 25.0000), control: CGPoint(x: 46.0000, y: 5.0000))
            p.move(to: CGPoint(x: 79.0000, y: 49.0000))
            p.addQuadCurve(to: CGPoint(x: 23.0000, y: 63.0000), control: CGPoint(x: 53.0000, y: 40.0000))
            p.addLine(to: CGPoint(x: 32.0000, y: 70.0000))
            p.move(to: CGPoint(x: 56.0000, y: 18.0000))
            p.addLine(to: CGPoint(x: 60.0000, y: 62.0000))
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
        SketchPlate(outline: outline, seams: seams, material: .graphite, luminous: light, shading: shade, grain: 40)
    }
}


#Preview {
    RightElbowJoint()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
