import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct LeftIndexDistal: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 28.5714, y: 26.9231))
            p.addLine(to: CGPoint(x: 100.0000, y: 0.0000))
            p.addLine(to: CGPoint(x: 100.0000, y: 50.0000))
            p.addLine(to: CGPoint(x: 35.7143, y: 100.0000))
            p.addLine(to: CGPoint(x: 0.0000, y: 84.6154))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 35.7143, y: 53.8462))
            p.addLine(to: CGPoint(x: 78.5714, y: 34.6154))
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
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 97)
    }
}


#Preview {
    LeftIndexDistal()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
