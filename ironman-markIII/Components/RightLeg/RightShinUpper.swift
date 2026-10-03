import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct RightShinUpper: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 79.2683, y: 0.0000))
            p.addLine(to: CGPoint(x: 69.5122, y: 30.4762))
            p.addLine(to: CGPoint(x: 58.5366, y: 24.7619))
            p.addLine(to: CGPoint(x: 32.9268, y: 29.5238))
            p.addLine(to: CGPoint(x: 19.5122, y: 12.3810))
            p.addLine(to: CGPoint(x: 6.0976, y: 40.0000))
            p.addLine(to: CGPoint(x: 0.0000, y: 60.9524))
            p.addLine(to: CGPoint(x: 25.6098, y: 100.0000))
            p.addLine(to: CGPoint(x: 75.6098, y: 100.0000))
            p.addLine(to: CGPoint(x: 100.0000, y: 63.8095))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 60.9756, y: 28.5714))
            p.addLine(to: CGPoint(x: 75.6098, y: 97.1429))
            p.move(to: CGPoint(x: 32.9268, y: 32.3810))
            p.addLine(to: CGPoint(x: 40.2439, y: 97.1429))
        }
    }
    private var light: Path {
        Path { p in

        }
    }
    private var shade: Path {
        Path { p in
            p.move(to: CGPoint(x: 100.0000, y: 63.8095))
            p.addLine(to: CGPoint(x: 75.6098, y: 100.0000))
            p.addLine(to: CGPoint(x: 25.6098, y: 100.0000))
            p.addLine(to: CGPoint(x: 0.0000, y: 60.9524))
            p.addLine(to: CGPoint(x: 4.8780, y: 60.9524))
            p.addLine(to: CGPoint(x: 29.2683, y: 96.1905))
            p.addLine(to: CGPoint(x: 71.9512, y: 96.1905))
            p.addLine(to: CGPoint(x: 96.3415, y: 60.0000))
            p.closeSubpath()
        }
    }
    var body: some View {
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 67)
    }
}


#Preview {
    RightShinUpper()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
