import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct LeftShinUpper: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 20.7317, y: 0.0000))
            p.addLine(to: CGPoint(x: 30.4878, y: 30.4762))
            p.addLine(to: CGPoint(x: 41.4634, y: 24.7619))
            p.addLine(to: CGPoint(x: 67.0732, y: 29.5238))
            p.addLine(to: CGPoint(x: 80.4878, y: 12.3810))
            p.addLine(to: CGPoint(x: 93.9024, y: 40.0000))
            p.addLine(to: CGPoint(x: 100.0000, y: 60.9524))
            p.addLine(to: CGPoint(x: 74.3902, y: 100.0000))
            p.addLine(to: CGPoint(x: 24.3902, y: 100.0000))
            p.addLine(to: CGPoint(x: 0.0000, y: 63.8095))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 39.0244, y: 28.5714))
            p.addLine(to: CGPoint(x: 24.3902, y: 97.1429))
            p.move(to: CGPoint(x: 67.0732, y: 32.3810))
            p.addLine(to: CGPoint(x: 59.7561, y: 97.1429))
        }
    }
    private var light: Path {
        Path { p in

        }
    }
    private var shade: Path {
        Path { p in
            p.move(to: CGPoint(x: 0.0000, y: 63.8095))
            p.addLine(to: CGPoint(x: 24.3902, y: 100.0000))
            p.addLine(to: CGPoint(x: 74.3902, y: 100.0000))
            p.addLine(to: CGPoint(x: 100.0000, y: 60.9524))
            p.addLine(to: CGPoint(x: 95.1220, y: 60.9524))
            p.addLine(to: CGPoint(x: 70.7317, y: 96.1905))
            p.addLine(to: CGPoint(x: 28.0488, y: 96.1905))
            p.addLine(to: CGPoint(x: 3.6585, y: 60.0000))
            p.closeSubpath()
        }
    }
    var body: some View {
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 52)
    }
}


#Preview {
    LeftShinUpper()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
