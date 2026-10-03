import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct LeftThighInner: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 28.2051, y: 0.0000))
            p.addLine(to: CGPoint(x: 69.2308, y: 15.3488))
            p.addLine(to: CGPoint(x: 100.0000, y: 37.2093))
            p.addLine(to: CGPoint(x: 69.2308, y: 75.8140))
            p.addLine(to: CGPoint(x: 43.5897, y: 100.0000))
            p.addLine(to: CGPoint(x: 0.0000, y: 94.8837))
            p.addLine(to: CGPoint(x: 33.3333, y: 54.8837))
            p.addLine(to: CGPoint(x: 61.5385, y: 34.4186))
            p.addLine(to: CGPoint(x: 48.7179, y: 15.3488))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 76.9231, y: 38.6047))
            p.addLine(to: CGPoint(x: 48.7179, y: 77.6744))
            p.addLine(to: CGPoint(x: 20.5128, y: 92.5581))
        }
    }
    private var light: Path {
        Path { p in

        }
    }
    private var shade: Path {
        Path { p in
            p.move(to: CGPoint(x: 58.9744, y: 25.1163))
            p.addLine(to: CGPoint(x: 79.4872, y: 38.6047))
            p.addLine(to: CGPoint(x: 48.7179, y: 77.6744))
            p.addLine(to: CGPoint(x: 20.5128, y: 92.5581))
            p.addLine(to: CGPoint(x: 43.5897, y: 100.0000))
            p.addLine(to: CGPoint(x: 69.2308, y: 75.8140))
            p.addLine(to: CGPoint(x: 100.0000, y: 37.2093))
            p.addLine(to: CGPoint(x: 69.2308, y: 15.3488))
            p.closeSubpath()
        }
    }
    var body: some View {
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 49)
    }
}


#Preview {
    LeftThighInner()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
