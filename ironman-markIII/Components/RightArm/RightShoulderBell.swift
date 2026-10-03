import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct RightShoulderBell: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 92.7083, y: 49.2308))
            p.addQuadCurve(to: CGPoint(x: 46.8750, y: 4.6154), control: CGPoint(x: 73.9583, y: 4.6154))
            p.addQuadCurve(to: CGPoint(x: 7.2917, y: 43.0769), control: CGPoint(x: 19.7917, y: 0.0000))
            p.addLine(to: CGPoint(x: 0.0000, y: 70.7692))
            p.addLine(to: CGPoint(x: 12.5000, y: 100.0000))
            p.addLine(to: CGPoint(x: 85.4167, y: 98.4615))
            p.addLine(to: CGPoint(x: 89.5833, y: 76.9231))
            p.addLine(to: CGPoint(x: 97.9167, y: 96.9231))
            p.addLine(to: CGPoint(x: 100.0000, y: 96.9231))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 95.8333, y: 72.3077))
            p.addLine(to: CGPoint(x: 84.3750, y: 75.3846))
            p.addLine(to: CGPoint(x: 84.3750, y: 92.3077))
            p.move(to: CGPoint(x: 85.4167, y: 76.9231))
            p.addLine(to: CGPoint(x: 17.7083, y: 81.5385))
            p.addLine(to: CGPoint(x: 4.1667, y: 67.6923))
            p.move(to: CGPoint(x: 61.4583, y: 18.4615))
            p.addLine(to: CGPoint(x: 51.0417, y: 6.1538))
            p.addLine(to: CGPoint(x: 44.7917, y: 9.2308))
            p.addLine(to: CGPoint(x: 47.9167, y: 15.3846))
            p.addLine(to: CGPoint(x: 40.6250, y: 21.5385))
            p.addLine(to: CGPoint(x: 48.9583, y: 20.0000))
            p.addLine(to: CGPoint(x: 53.1250, y: 13.8462))
            p.addLine(to: CGPoint(x: 57.2917, y: 23.0769))
            p.closeSubpath()
        }
    }
    private var light: Path {
        Path { p in

        }
    }
    private var shade: Path {
        Path { p in
            p.move(to: CGPoint(x: 97.9167, y: 73.8462))
            p.addLine(to: CGPoint(x: 89.5833, y: 72.3077))
            p.addLine(to: CGPoint(x: 85.4167, y: 92.3077))
            p.addLine(to: CGPoint(x: 15.6250, y: 93.8462))
            p.addLine(to: CGPoint(x: 7.2917, y: 80.0000))
            p.addLine(to: CGPoint(x: 0.0000, y: 70.7692))
            p.addLine(to: CGPoint(x: 12.5000, y: 100.0000))
            p.addLine(to: CGPoint(x: 85.4167, y: 98.4615))
            p.addLine(to: CGPoint(x: 89.5833, y: 76.9231))
            p.addLine(to: CGPoint(x: 97.9167, y: 96.9231))
            p.closeSubpath()
        }
    }
    var body: some View {
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 37)
    }
}


#Preview {
    RightShoulderBell()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
