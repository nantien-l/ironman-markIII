import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct LeftThighFrontUpper: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 2.7778, y: 0.0000))
            p.addLine(to: CGPoint(x: 55.5556, y: 3.5294))
            p.addLine(to: CGPoint(x: 93.0556, y: 18.8235))
            p.addLine(to: CGPoint(x: 100.0000, y: 49.4118))
            p.addLine(to: CGPoint(x: 86.1111, y: 98.8235))
            p.addLine(to: CGPoint(x: 55.5556, y: 83.5294))
            p.addLine(to: CGPoint(x: 33.3333, y: 87.0588))
            p.addLine(to: CGPoint(x: 11.1111, y: 100.0000))
            p.addLine(to: CGPoint(x: 0.0000, y: 57.6471))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 5.5556, y: 4.7059))
            p.addLine(to: CGPoint(x: 54.1667, y: 4.7059))
            p.addLine(to: CGPoint(x: 88.8889, y: 18.8235))
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
        SketchPlate(outline: outline, seams: seams, material: .brass, luminous: light, shading: shade, grain: 46)
    }
}


#Preview {
    LeftThighFrontUpper()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
