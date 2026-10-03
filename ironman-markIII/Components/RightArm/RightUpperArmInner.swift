import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct RightUpperArmInner: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 95.9184, y: 0.0000))
            p.addLine(to: CGPoint(x: 32.6531, y: 4.4643))
            p.addLine(to: CGPoint(x: 0.0000, y: 20.5357))
            p.addLine(to: CGPoint(x: 6.1224, y: 46.4286))
            p.addLine(to: CGPoint(x: 40.8163, y: 100.0000))
            p.addLine(to: CGPoint(x: 100.0000, y: 98.2143))
            p.addLine(to: CGPoint(x: 63.2653, y: 21.4286))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 36.7347, y: 15.1786))
            p.addLine(to: CGPoint(x: 42.8571, y: 39.2857))
            p.move(to: CGPoint(x: 81.6327, y: 80.3571))
            p.addLine(to: CGPoint(x: 36.7347, y: 82.1429))
        }
    }
    private var light: Path {
        Path { p in

        }
    }
    private var shade: Path {
        Path { p in
            p.move(to: CGPoint(x: 20.4082, y: 17.8571))
            p.addLine(to: CGPoint(x: 6.1224, y: 46.4286))
            p.addLine(to: CGPoint(x: 40.8163, y: 100.0000))
            p.addLine(to: CGPoint(x: 53.0612, y: 98.2143))
            p.addLine(to: CGPoint(x: 18.3673, y: 45.5357))
            p.closeSubpath()
        }
    }
    var body: some View {
        SketchPlate(outline: outline, seams: seams, material: .brass, luminous: light, shading: shade, grain: 39)
    }
}


#Preview {
    RightUpperArmInner()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
