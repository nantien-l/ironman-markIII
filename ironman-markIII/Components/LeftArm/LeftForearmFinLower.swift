import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct LeftForearmFinLower: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 0.0000, y: 0.0000))
            p.addLine(to: CGPoint(x: 100.0000, y: 43.9024))
            p.addLine(to: CGPoint(x: 27.7778, y: 100.0000))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 11.1111, y: 29.2683))
            p.addLine(to: CGPoint(x: 50.0000, y: 51.2195))
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
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 89)
    }
}


#Preview {
    LeftForearmFinLower()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
