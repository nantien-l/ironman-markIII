import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct LeftHipPlate: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 32.8767, y: 0.0000))
            p.addLine(to: CGPoint(x: 71.2329, y: 26.6667))
            p.addLine(to: CGPoint(x: 100.0000, y: 65.0000))
            p.addLine(to: CGPoint(x: 87.6712, y: 81.6667))
            p.addLine(to: CGPoint(x: 36.9863, y: 100.0000))
            p.addLine(to: CGPoint(x: 0.0000, y: 86.6667))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 42.4658, y: 13.3333))
            p.addLine(to: CGPoint(x: 24.6575, y: 75.0000))
            p.addLine(to: CGPoint(x: 53.4247, y: 85.0000))
            p.move(to: CGPoint(x: 31.5068, y: 20.0000))
            p.addLine(to: CGPoint(x: 10.9589, y: 78.3333))
            p.addLine(to: CGPoint(x: 28.7671, y: 90.0000))
            p.move(to: CGPoint(x: 71.2329, y: 35.0000))
            p.addLine(to: CGPoint(x: 87.6712, y: 63.3333))
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
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 27)
    }
}


#Preview {
    LeftHipPlate()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
