import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct RightUpperChest: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 70.7865, y: 7.5000))
            p.addLine(to: CGPoint(x: 48.3146, y: 0.0000))
            p.addLine(to: CGPoint(x: 25.8427, y: 20.0000))
            p.addLine(to: CGPoint(x: 0.0000, y: 42.5000))
            p.addLine(to: CGPoint(x: 0.0000, y: 76.2500))
            p.addLine(to: CGPoint(x: 7.8652, y: 76.2500))
            p.addLine(to: CGPoint(x: 12.3596, y: 48.7500))
            p.addLine(to: CGPoint(x: 38.2022, y: 36.2500))
            p.addLine(to: CGPoint(x: 53.9326, y: 18.7500))
            p.addLine(to: CGPoint(x: 73.0337, y: 20.0000))
            p.addLine(to: CGPoint(x: 86.5169, y: 47.5000))
            p.addLine(to: CGPoint(x: 79.7753, y: 60.0000))
            p.addLine(to: CGPoint(x: 34.8315, y: 86.2500))
            p.addLine(to: CGPoint(x: 21.3483, y: 100.0000))
            p.addLine(to: CGPoint(x: 49.4382, y: 97.5000))
            p.addLine(to: CGPoint(x: 87.6404, y: 77.5000))
            p.addLine(to: CGPoint(x: 100.0000, y: 53.7500))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 70.7865, y: 15.0000))
            p.addLine(to: CGPoint(x: 51.6854, y: 10.0000))
            p.addLine(to: CGPoint(x: 37.0787, y: 25.0000))
            p.addLine(to: CGPoint(x: 12.3596, y: 41.2500))
            p.move(to: CGPoint(x: 8.9888, y: 52.5000))
            p.addLine(to: CGPoint(x: 12.3596, y: 72.5000))
            p.addLine(to: CGPoint(x: -1.1236, y: 76.2500))
            p.addEllipse(in: CGRect(x: 74.1573, y: 52.5000, width: 7.8652, height: 8.7500))
        }
    }
    private var light: Path {
        Path { p in

        }
    }
    private var shade: Path {
        Path { p in
            p.move(to: CGPoint(x: 100.0000, y: 53.7500))
            p.addLine(to: CGPoint(x: 87.6404, y: 77.5000))
            p.addLine(to: CGPoint(x: 49.4382, y: 97.5000))
            p.addLine(to: CGPoint(x: 21.3483, y: 100.0000))
            p.addLine(to: CGPoint(x: 30.3371, y: 92.5000))
            p.addLine(to: CGPoint(x: 48.3146, y: 92.5000))
            p.addLine(to: CGPoint(x: 84.2697, y: 73.7500))
            p.addLine(to: CGPoint(x: 95.5056, y: 53.7500))
            p.closeSubpath()
        }
    }
    var body: some View {
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 11)
    }
}


#Preview {
    RightUpperChest()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
