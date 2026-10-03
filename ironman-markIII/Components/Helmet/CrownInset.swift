import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct CrownInset: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 0.0000, y: 0.0000))
            p.addLine(to: CGPoint(x: 100.0000, y: 0.0000))
            p.addLine(to: CGPoint(x: 88.2353, y: 100.0000))
            p.addLine(to: CGPoint(x: 11.7647, y: 100.0000))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 5.8824, y: 20.0000))
            p.addLine(to: CGPoint(x: 94.1176, y: 20.0000))
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
        SketchPlate(outline: outline, seams: seams, material: .brass, luminous: light, shading: shade, grain: 75)
    }
}


#Preview {
    CrownInset()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
