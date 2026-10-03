import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct LeftTemple: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 5.8824, y: 13.6364))
            p.addLine(to: CGPoint(x: 58.8235, y: 0.0000))
            p.addLine(to: CGPoint(x: 52.9412, y: 47.7273))
            p.addLine(to: CGPoint(x: 64.7059, y: 81.8182))
            p.addLine(to: CGPoint(x: 100.0000, y: 100.0000))
            p.addLine(to: CGPoint(x: 52.9412, y: 93.1818))
            p.addLine(to: CGPoint(x: 0.0000, y: 81.8182))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 29.4118, y: 15.9091))
            p.addLine(to: CGPoint(x: 23.5294, y: 76.1364))
            p.addLine(to: CGPoint(x: 70.5882, y: 89.7727))
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
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 3)
    }
}


#Preview {
    LeftTemple()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
