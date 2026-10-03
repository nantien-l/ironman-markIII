import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct LeftToePlate: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 8.9744, y: 0.0000))
            p.addLine(to: CGPoint(x: 33.3333, y: 26.6667))
            p.addLine(to: CGPoint(x: 80.7692, y: 26.6667))
            p.addLine(to: CGPoint(x: 100.0000, y: 0.0000))
            p.addLine(to: CGPoint(x: 100.0000, y: 100.0000))
            p.addLine(to: CGPoint(x: 0.0000, y: 100.0000))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 7.6923, y: 17.7778))
            p.addLine(to: CGPoint(x: 19.2308, y: 91.1111))
            p.addLine(to: CGPoint(x: 85.8974, y: 91.1111))
            p.addLine(to: CGPoint(x: 96.1538, y: 15.5556))
            p.move(to: CGPoint(x: 33.3333, y: 28.8889))
            p.addLine(to: CGPoint(x: 19.2308, y: 91.1111))
            p.move(to: CGPoint(x: 78.2051, y: 28.8889))
            p.addLine(to: CGPoint(x: 85.8974, y: 91.1111))
            p.move(to: CGPoint(x: 1.2821, y: 91.1111))
            p.addLine(to: CGPoint(x: 98.7179, y: 91.1111))
            p.move(to: CGPoint(x: 42.3077, y: 15.5556))
            p.addLine(to: CGPoint(x: 41.0256, y: 31.1111))
            p.addLine(to: CGPoint(x: 69.2308, y: 31.1111))
            p.addLine(to: CGPoint(x: 69.2308, y: 15.5556))
        }
    }
    private var light: Path {
        Path { p in

        }
    }
    private var shade: Path {
        Path { p in
            p.move(to: CGPoint(x: 0.0000, y: 91.1111))
            p.addLine(to: CGPoint(x: 100.0000, y: 91.1111))
            p.addLine(to: CGPoint(x: 100.0000, y: 100.0000))
            p.addLine(to: CGPoint(x: 0.0000, y: 100.0000))
            p.closeSubpath()
        }
    }
    var body: some View {
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 58)
    }
}


#Preview {
    LeftToePlate()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
