import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct LeftShinCenter: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 6.7416, y: 0.0000))
            p.addLine(to: CGPoint(x: 26.9663, y: 24.8322))
            p.addLine(to: CGPoint(x: 68.5393, y: 26.1745))
            p.addLine(to: CGPoint(x: 97.7528, y: 0.0000))
            p.addLine(to: CGPoint(x: 100.0000, y: 44.2953))
            p.addQuadCurve(to: CGPoint(x: 69.6629, y: 92.6174), control: CGPoint(x: 95.5056, y: 67.1141))
            p.addQuadCurve(to: CGPoint(x: 32.5843, y: 91.2752), control: CGPoint(x: 50.5618, y: 100.0000))
            p.addLine(to: CGPoint(x: 1.1236, y: 61.0738))
            p.addLine(to: CGPoint(x: 0.0000, y: 23.4899))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 7.8652, y: 5.3691))
            p.addLine(to: CGPoint(x: 23.5955, y: 26.1745))
            p.addLine(to: CGPoint(x: 31.4607, y: 28.8591))
            p.addLine(to: CGPoint(x: 65.1685, y: 28.8591))
            p.addLine(to: CGPoint(x: 89.8876, y: 10.0671))
        }
    }
    private var light: Path {
        Path { p in

        }
    }
    private var shade: Path {
        Path { p in
            p.move(to: CGPoint(x: 0.0000, y: 23.4899))
            p.addLine(to: CGPoint(x: 1.1236, y: 61.0738))
            p.addLine(to: CGPoint(x: 32.5843, y: 91.2752))
            p.addLine(to: CGPoint(x: 39.3258, y: 93.2886))
            p.addLine(to: CGPoint(x: 6.7416, y: 59.7315))
            p.addLine(to: CGPoint(x: 5.6180, y: 22.8188))
            p.closeSubpath()
        }
    }
    var body: some View {
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 53)
    }
}


#Preview {
    LeftShinCenter()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
