import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct RightHeelArmor: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 80.0000, y: 0.0000))
            p.addLine(to: CGPoint(x: 0.0000, y: 24.0964))
            p.addLine(to: CGPoint(x: 0.0000, y: 100.0000))
            p.addLine(to: CGPoint(x: 60.0000, y: 66.2651))
            p.addLine(to: CGPoint(x: 100.0000, y: 43.3735))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 30.0000, y: 27.7108))
            p.addLine(to: CGPoint(x: 60.0000, y: 45.7831))
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
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 74)
    }
}


#Preview {
    RightHeelArmor()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
