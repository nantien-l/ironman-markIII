import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct LeftForearmFinUpper: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 26.0870, y: 0.0000))
            p.addLine(to: CGPoint(x: 82.6087, y: 64.2857))
            p.addLine(to: CGPoint(x: 100.0000, y: 100.0000))
            p.addLine(to: CGPoint(x: 21.7391, y: 71.4286))
            p.addLine(to: CGPoint(x: 0.0000, y: 38.0952))
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
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 85)
    }
}


#Preview {
    LeftForearmFinUpper()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
