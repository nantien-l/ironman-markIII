import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct RightTemple: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 94.1176, y: 13.6364))
            p.addLine(to: CGPoint(x: 41.1765, y: 0.0000))
            p.addLine(to: CGPoint(x: 47.0588, y: 47.7273))
            p.addLine(to: CGPoint(x: 35.2941, y: 81.8182))
            p.addLine(to: CGPoint(x: 0.0000, y: 100.0000))
            p.addLine(to: CGPoint(x: 47.0588, y: 93.1818))
            p.addLine(to: CGPoint(x: 100.0000, y: 81.8182))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 70.5882, y: 15.9091))
            p.addLine(to: CGPoint(x: 76.4706, y: 76.1364))
            p.addLine(to: CGPoint(x: 29.4118, y: 89.7727))
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
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 4)
    }
}


#Preview {
    RightTemple()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
