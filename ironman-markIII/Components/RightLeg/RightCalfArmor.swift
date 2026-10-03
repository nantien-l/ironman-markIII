import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct RightCalfArmor: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 0.0000, y: 0.0000))
            p.addLine(to: CGPoint(x: 17.1429, y: 75.7282))
            p.addLine(to: CGPoint(x: 62.8571, y: 100.0000))
            p.addLine(to: CGPoint(x: 100.0000, y: 92.2330))
            p.addLine(to: CGPoint(x: 71.4286, y: 55.3398))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 20.0000, y: 27.1845))
            p.addLine(to: CGPoint(x: 45.7143, y: 89.3204))
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
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 70)
    }
}


#Preview {
    RightCalfArmor()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
