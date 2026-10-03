import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct RightThighInner: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 71.7949, y: 0.0000))
            p.addLine(to: CGPoint(x: 30.7692, y: 15.3488))
            p.addLine(to: CGPoint(x: 0.0000, y: 37.2093))
            p.addLine(to: CGPoint(x: 30.7692, y: 75.8140))
            p.addLine(to: CGPoint(x: 56.4103, y: 100.0000))
            p.addLine(to: CGPoint(x: 100.0000, y: 94.8837))
            p.addLine(to: CGPoint(x: 66.6667, y: 54.8837))
            p.addLine(to: CGPoint(x: 38.4615, y: 34.4186))
            p.addLine(to: CGPoint(x: 51.2821, y: 15.3488))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 23.0769, y: 38.6047))
            p.addLine(to: CGPoint(x: 51.2821, y: 77.6744))
            p.addLine(to: CGPoint(x: 79.4872, y: 92.5581))
        }
    }
    private var light: Path {
        Path { p in

        }
    }
    private var shade: Path {
        Path { p in
            p.move(to: CGPoint(x: 41.0256, y: 25.1163))
            p.addLine(to: CGPoint(x: 20.5128, y: 38.6047))
            p.addLine(to: CGPoint(x: 51.2821, y: 77.6744))
            p.addLine(to: CGPoint(x: 79.4872, y: 92.5581))
            p.addLine(to: CGPoint(x: 56.4103, y: 100.0000))
            p.addLine(to: CGPoint(x: 30.7692, y: 75.8140))
            p.addLine(to: CGPoint(x: 0.0000, y: 37.2093))
            p.addLine(to: CGPoint(x: 30.7692, y: 15.3488))
            p.closeSubpath()
        }
    }
    var body: some View {
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 64)
    }
}


#Preview {
    RightThighInner()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
