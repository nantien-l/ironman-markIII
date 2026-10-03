import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct PelvisCenter: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 5.4945, y: 0.0000))
            p.addQuadCurve(to: CGPoint(x: 93.4066, y: 0.0000), control: CGPoint(x: 49.4505, y: 8.7379))
            p.addLine(to: CGPoint(x: 100.0000, y: 21.3592))
            p.addLine(to: CGPoint(x: 79.1209, y: 53.3981))
            p.addLine(to: CGPoint(x: 63.7363, y: 100.0000))
            p.addLine(to: CGPoint(x: 36.2637, y: 100.0000))
            p.addLine(to: CGPoint(x: 20.8791, y: 53.3981))
            p.addLine(to: CGPoint(x: 0.0000, y: 21.3592))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 4.3956, y: 21.3592))
            p.addLine(to: CGPoint(x: 26.3736, y: 31.0680))
            p.addLine(to: CGPoint(x: 36.2637, y: 50.4854))
            p.addLine(to: CGPoint(x: 63.7363, y: 50.4854))
            p.addLine(to: CGPoint(x: 72.5275, y: 31.0680))
            p.addLine(to: CGPoint(x: 95.6044, y: 21.3592))
            p.move(to: CGPoint(x: 36.2637, y: 50.4854))
            p.addLine(to: CGPoint(x: 43.9560, y: 99.0291))
            p.move(to: CGPoint(x: 63.7363, y: 50.4854))
            p.addLine(to: CGPoint(x: 56.0440, y: 99.0291))
            p.move(to: CGPoint(x: 48.3516, y: 51.4563))
            p.addLine(to: CGPoint(x: 49.4505, y: 98.0583))
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
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 26)
    }
}


#Preview {
    PelvisCenter()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
