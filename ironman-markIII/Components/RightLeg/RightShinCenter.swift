import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct RightShinCenter: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 93.2584, y: 0.0000))
            p.addLine(to: CGPoint(x: 73.0337, y: 24.8322))
            p.addLine(to: CGPoint(x: 31.4607, y: 26.1745))
            p.addLine(to: CGPoint(x: 2.2472, y: 0.0000))
            p.addLine(to: CGPoint(x: 0.0000, y: 44.2953))
            p.addQuadCurve(to: CGPoint(x: 30.3371, y: 92.6174), control: CGPoint(x: 4.4944, y: 67.1141))
            p.addQuadCurve(to: CGPoint(x: 67.4157, y: 91.2752), control: CGPoint(x: 49.4382, y: 100.0000))
            p.addLine(to: CGPoint(x: 98.8764, y: 61.0738))
            p.addLine(to: CGPoint(x: 100.0000, y: 23.4899))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 92.1348, y: 5.3691))
            p.addLine(to: CGPoint(x: 76.4045, y: 26.1745))
            p.addLine(to: CGPoint(x: 68.5393, y: 28.8591))
            p.addLine(to: CGPoint(x: 34.8315, y: 28.8591))
            p.addLine(to: CGPoint(x: 10.1124, y: 10.0671))
        }
    }
    private var light: Path {
        Path { p in

        }
    }
    private var shade: Path {
        Path { p in
            p.move(to: CGPoint(x: 100.0000, y: 23.4899))
            p.addLine(to: CGPoint(x: 98.8764, y: 61.0738))
            p.addLine(to: CGPoint(x: 67.4157, y: 91.2752))
            p.addLine(to: CGPoint(x: 60.6742, y: 93.2886))
            p.addLine(to: CGPoint(x: 93.2584, y: 59.7315))
            p.addLine(to: CGPoint(x: 94.3820, y: 22.8188))
            p.closeSubpath()
        }
    }
    var body: some View {
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 68)
    }
}


#Preview {
    RightShinCenter()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
