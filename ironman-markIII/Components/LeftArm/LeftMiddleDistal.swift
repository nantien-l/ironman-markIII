import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct LeftMiddleDistal: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 27.7778, y: 13.5135))
            p.addLine(to: CGPoint(x: 72.2222, y: 0.0000))
            p.addLine(to: CGPoint(x: 100.0000, y: 48.6486))
            p.addLine(to: CGPoint(x: 61.1111, y: 100.0000))
            p.addLine(to: CGPoint(x: 33.3333, y: 94.5946))
            p.addLine(to: CGPoint(x: 0.0000, y: 40.5405))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 22.2222, y: 35.1351))
            p.addLine(to: CGPoint(x: 83.3333, y: 32.4324))
            p.move(to: CGPoint(x: 27.7778, y: 62.1622))
            p.addLine(to: CGPoint(x: 72.2222, y: 54.0541))
        }
    }
    private var light: Path {
        Path { p in

        }
    }
    private var shade: Path {
        Path { p in

        }
    }
    var body: some View {
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 101)
    }
}


#Preview {
    LeftMiddleDistal()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
