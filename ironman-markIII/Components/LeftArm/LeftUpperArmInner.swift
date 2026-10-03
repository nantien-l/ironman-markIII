import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct LeftUpperArmInner: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 4.0816, y: 0.0000))
            p.addLine(to: CGPoint(x: 67.3469, y: 4.4643))
            p.addLine(to: CGPoint(x: 100.0000, y: 20.5357))
            p.addLine(to: CGPoint(x: 93.8776, y: 46.4286))
            p.addLine(to: CGPoint(x: 59.1837, y: 100.0000))
            p.addLine(to: CGPoint(x: 0.0000, y: 98.2143))
            p.addLine(to: CGPoint(x: 36.7347, y: 21.4286))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 63.2653, y: 15.1786))
            p.addLine(to: CGPoint(x: 57.1429, y: 39.2857))
            p.move(to: CGPoint(x: 18.3673, y: 80.3571))
            p.addLine(to: CGPoint(x: 63.2653, y: 82.1429))
        }
    }
    private var light: Path {
        Path { p in

        }
    }
    private var shade: Path {
        Path { p in
            p.move(to: CGPoint(x: 79.5918, y: 17.8571))
            p.addLine(to: CGPoint(x: 93.8776, y: 46.4286))
            p.addLine(to: CGPoint(x: 59.1837, y: 100.0000))
            p.addLine(to: CGPoint(x: 46.9388, y: 98.2143))
            p.addLine(to: CGPoint(x: 81.6327, y: 45.5357))
            p.closeSubpath()
        }
    }
    var body: some View {
        SketchPlate(outline: outline, seams: seams, material: .brass, luminous: light, shading: shade, grain: 31)
    }
}


#Preview {
    LeftUpperArmInner()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
