import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct LeftThighFrontLower: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 0.0000, y: 14.8936))
            p.addLine(to: CGPoint(x: 29.6296, y: 2.1277))
            p.addLine(to: CGPoint(x: 59.2593, y: 0.0000))
            p.addLine(to: CGPoint(x: 100.0000, y: 13.8298))
            p.addLine(to: CGPoint(x: 74.0741, y: 100.0000))
            p.addLine(to: CGPoint(x: 14.8148, y: 100.0000))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 9.2593, y: 54.2553))
            p.addLine(to: CGPoint(x: 20.3704, y: 97.8723))
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
        SketchPlate(outline: outline, seams: seams, material: .brass, luminous: light, shading: shade, grain: 47)
    }
}


#Preview {
    LeftThighFrontLower()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
