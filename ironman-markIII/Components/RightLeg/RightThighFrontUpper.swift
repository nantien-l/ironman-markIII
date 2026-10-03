import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct RightThighFrontUpper: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 97.2222, y: 0.0000))
            p.addLine(to: CGPoint(x: 44.4444, y: 3.5294))
            p.addLine(to: CGPoint(x: 6.9444, y: 18.8235))
            p.addLine(to: CGPoint(x: 0.0000, y: 49.4118))
            p.addLine(to: CGPoint(x: 13.8889, y: 98.8235))
            p.addLine(to: CGPoint(x: 44.4444, y: 83.5294))
            p.addLine(to: CGPoint(x: 66.6667, y: 87.0588))
            p.addLine(to: CGPoint(x: 88.8889, y: 100.0000))
            p.addLine(to: CGPoint(x: 100.0000, y: 57.6471))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 94.4444, y: 4.7059))
            p.addLine(to: CGPoint(x: 45.8333, y: 4.7059))
            p.addLine(to: CGPoint(x: 11.1111, y: 18.8235))
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
        SketchPlate(outline: outline, seams: seams, material: .brass, luminous: light, shading: shade, grain: 61)
    }
}


#Preview {
    RightThighFrontUpper()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
