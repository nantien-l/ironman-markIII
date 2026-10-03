import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct RightForearmFinUpper: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 73.9130, y: 0.0000))
            p.addLine(to: CGPoint(x: 17.3913, y: 64.2857))
            p.addLine(to: CGPoint(x: 0.0000, y: 100.0000))
            p.addLine(to: CGPoint(x: 78.2609, y: 71.4286))
            p.addLine(to: CGPoint(x: 100.0000, y: 38.0952))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in

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
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 86)
    }
}


#Preview {
    RightForearmFinUpper()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
