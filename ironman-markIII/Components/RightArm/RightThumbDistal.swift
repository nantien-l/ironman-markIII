import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct RightThumbDistal: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 84.0000, y: 0.0000))
            p.addLine(to: CGPoint(x: 0.0000, y: 72.2222))
            p.addLine(to: CGPoint(x: 8.0000, y: 100.0000))
            p.addLine(to: CGPoint(x: 100.0000, y: 38.8889))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 28.0000, y: 55.5556))
            p.addLine(to: CGPoint(x: 36.0000, y: 77.7778))
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
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 94)
    }
}


#Preview {
    RightThumbDistal()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
