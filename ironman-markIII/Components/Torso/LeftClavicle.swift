import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct LeftClavicle: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 93.9394, y: 0.0000))
            p.addLine(to: CGPoint(x: 100.0000, y: 46.5517))
            p.addLine(to: CGPoint(x: 69.6970, y: 56.8966))
            p.addLine(to: CGPoint(x: 56.0606, y: 86.2069))
            p.addLine(to: CGPoint(x: 12.1212, y: 100.0000))
            p.addLine(to: CGPoint(x: 0.0000, y: 79.3103))
            p.addLine(to: CGPoint(x: 33.3333, y: 48.2759))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 93.9394, y: 12.0690))
            p.addLine(to: CGPoint(x: 51.5152, y: 55.1724))
            p.addLine(to: CGPoint(x: 48.4848, y: 74.1379))
            p.addLine(to: CGPoint(x: 10.6061, y: 87.9310))
        }
    }
    private var light: Path {
        Path { p in

        }
    }
    private var shade: Path {
        Path { p in
            p.move(to: CGPoint(x: 0.0000, y: 79.3103))
            p.addLine(to: CGPoint(x: 12.1212, y: 100.0000))
            p.addLine(to: CGPoint(x: 56.0606, y: 86.2069))
            p.addLine(to: CGPoint(x: 69.6970, y: 56.8966))
            p.addLine(to: CGPoint(x: 100.0000, y: 46.5517))
            p.addLine(to: CGPoint(x: 93.9394, y: 41.3793))
            p.addLine(to: CGPoint(x: 65.1515, y: 53.4483))
            p.addLine(to: CGPoint(x: 50.0000, y: 79.3103))
            p.addLine(to: CGPoint(x: 13.6364, y: 93.1034))
            p.closeSubpath()
        }
    }
    var body: some View {
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 12)
    }
}


#Preview {
    LeftClavicle()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
