import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct FacePlate: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 3.8462, y: 8.1818))
            p.addLine(to: CGPoint(x: 23.0769, y: 0.0000))
            p.addLine(to: CGPoint(x: 76.9231, y: 0.0000))
            p.addLine(to: CGPoint(x: 96.1538, y: 8.1818))
            p.addLine(to: CGPoint(x: 100.0000, y: 45.4545))
            p.addLine(to: CGPoint(x: 96.1538, y: 66.3636))
            p.addLine(to: CGPoint(x: 78.2051, y: 86.3636))
            p.addLine(to: CGPoint(x: 70.5128, y: 100.0000))
            p.addLine(to: CGPoint(x: 29.4872, y: 100.0000))
            p.addLine(to: CGPoint(x: 21.7949, y: 86.3636))
            p.addLine(to: CGPoint(x: 3.8462, y: 66.3636))
            p.addLine(to: CGPoint(x: 0.0000, y: 46.3636))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 1.2821, y: 46.3636))
            p.addLine(to: CGPoint(x: 30.7692, y: 52.7273))
            p.addLine(to: CGPoint(x: 69.2308, y: 52.7273))
            p.addLine(to: CGPoint(x: 100.0000, y: 46.3636))
            p.move(to: CGPoint(x: 3.8462, y: 57.2727))
            p.addQuadCurve(to: CGPoint(x: 24.3590, y: 81.8182), control: CGPoint(x: 17.9487, y: 65.4545))
            p.addLine(to: CGPoint(x: 30.7692, y: 98.1818))
            p.move(to: CGPoint(x: 96.1538, y: 57.2727))
            p.addQuadCurve(to: CGPoint(x: 75.6410, y: 81.8182), control: CGPoint(x: 82.0513, y: 65.4545))
            p.addLine(to: CGPoint(x: 69.2308, y: 98.1818))
        }
    }
    private var light: Path {
        Path { p in
            p.move(to: CGPoint(x: 3.8462, y: 50.9091))
            p.addLine(to: CGPoint(x: 34.6154, y: 54.5455))
            p.addLine(to: CGPoint(x: 34.6154, y: 59.0909))
            p.addLine(to: CGPoint(x: 23.0769, y: 59.0909))
            p.addLine(to: CGPoint(x: 5.1282, y: 55.4545))
            p.closeSubpath()
            p.move(to: CGPoint(x: 96.1538, y: 50.9091))
            p.addLine(to: CGPoint(x: 65.3846, y: 54.5455))
            p.addLine(to: CGPoint(x: 65.3846, y: 59.0909))
            p.addLine(to: CGPoint(x: 76.9231, y: 59.0909))
            p.addLine(to: CGPoint(x: 94.8718, y: 55.4545))
            p.closeSubpath()
        }
    }
    private var shade: Path {
        Path { p in
            p.move(to: CGPoint(x: 3.8462, y: 10.9091))
            p.addLine(to: CGPoint(x: 8.9744, y: 9.0909))
            p.addLine(to: CGPoint(x: 6.4103, y: 46.3636))
            p.addLine(to: CGPoint(x: 10.2564, y: 66.3636))
            p.addLine(to: CGPoint(x: 29.4872, y: 92.7273))
            p.addLine(to: CGPoint(x: 30.7692, y: 98.1818))
            p.addLine(to: CGPoint(x: 21.7949, y: 86.3636))
            p.addLine(to: CGPoint(x: 3.8462, y: 66.3636))
            p.addLine(to: CGPoint(x: 0.0000, y: 46.3636))
            p.closeSubpath()
            p.move(to: CGPoint(x: 96.1538, y: 10.9091))
            p.addLine(to: CGPoint(x: 91.0256, y: 9.0909))
            p.addLine(to: CGPoint(x: 93.5897, y: 46.3636))
            p.addLine(to: CGPoint(x: 89.7436, y: 66.3636))
            p.addLine(to: CGPoint(x: 70.5128, y: 92.7273))
            p.addLine(to: CGPoint(x: 69.2308, y: 98.1818))
            p.addLine(to: CGPoint(x: 78.2051, y: 86.3636))
            p.addLine(to: CGPoint(x: 96.1538, y: 66.3636))
            p.addLine(to: CGPoint(x: 100.0000, y: 46.3636))
            p.closeSubpath()
        }
    }
    var body: some View {
        SketchPlate(outline: outline, seams: seams, material: .brass, luminous: light, shading: shade, grain: 2)
    }
}


#Preview {
    FacePlate()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
