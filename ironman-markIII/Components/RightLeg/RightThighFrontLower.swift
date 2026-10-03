import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct RightThighFrontLower: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 100.0000, y: 14.8936))
            p.addLine(to: CGPoint(x: 70.3704, y: 2.1277))
            p.addLine(to: CGPoint(x: 40.7407, y: 0.0000))
            p.addLine(to: CGPoint(x: 0.0000, y: 13.8298))
            p.addLine(to: CGPoint(x: 25.9259, y: 100.0000))
            p.addLine(to: CGPoint(x: 85.1852, y: 100.0000))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 90.7407, y: 54.2553))
            p.addLine(to: CGPoint(x: 79.6296, y: 97.8723))
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
        SketchPlate(outline: outline, seams: seams, material: .brass, luminous: light, shading: shade, grain: 62)
    }
}


#Preview {
    RightThighFrontLower()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
