import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct LeftShoulderBell: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 7.2917, y: 49.2308))
            p.addQuadCurve(to: CGPoint(x: 53.1250, y: 4.6154), control: CGPoint(x: 26.0417, y: 4.6154))
            p.addQuadCurve(to: CGPoint(x: 92.7083, y: 43.0769), control: CGPoint(x: 80.2083, y: 0.0000))
            p.addLine(to: CGPoint(x: 100.0000, y: 70.7692))
            p.addLine(to: CGPoint(x: 87.5000, y: 100.0000))
            p.addLine(to: CGPoint(x: 14.5833, y: 98.4615))
            p.addLine(to: CGPoint(x: 10.4167, y: 76.9231))
            p.addLine(to: CGPoint(x: 2.0833, y: 96.9231))
            p.addLine(to: CGPoint(x: 0.0000, y: 96.9231))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 4.1667, y: 72.3077))
            p.addLine(to: CGPoint(x: 15.6250, y: 75.3846))
            p.addLine(to: CGPoint(x: 15.6250, y: 92.3077))
            p.move(to: CGPoint(x: 14.5833, y: 76.9231))
            p.addLine(to: CGPoint(x: 82.2917, y: 81.5385))
            p.addLine(to: CGPoint(x: 95.8333, y: 67.6923))
            p.move(to: CGPoint(x: 38.5417, y: 18.4615))
            p.addLine(to: CGPoint(x: 48.9583, y: 6.1538))
            p.addLine(to: CGPoint(x: 55.2083, y: 9.2308))
            p.addLine(to: CGPoint(x: 52.0833, y: 15.3846))
            p.addLine(to: CGPoint(x: 59.3750, y: 21.5385))
            p.addLine(to: CGPoint(x: 51.0417, y: 20.0000))
            p.addLine(to: CGPoint(x: 46.8750, y: 13.8462))
            p.addLine(to: CGPoint(x: 42.7083, y: 23.0769))
            p.closeSubpath()
        }
    }
    private var light: Path {
        Path { p in

        }
    }
    private var shade: Path {
        Path { p in
            p.move(to: CGPoint(x: 2.0833, y: 73.8462))
            p.addLine(to: CGPoint(x: 10.4167, y: 72.3077))
            p.addLine(to: CGPoint(x: 14.5833, y: 92.3077))
            p.addLine(to: CGPoint(x: 84.3750, y: 93.8462))
            p.addLine(to: CGPoint(x: 92.7083, y: 80.0000))
            p.addLine(to: CGPoint(x: 100.0000, y: 70.7692))
            p.addLine(to: CGPoint(x: 87.5000, y: 100.0000))
            p.addLine(to: CGPoint(x: 14.5833, y: 98.4615))
            p.addLine(to: CGPoint(x: 10.4167, y: 76.9231))
            p.addLine(to: CGPoint(x: 2.0833, y: 96.9231))
            p.closeSubpath()
        }
    }
    var body: some View {
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 29)
    }
}


#Preview {
    LeftShoulderBell()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
