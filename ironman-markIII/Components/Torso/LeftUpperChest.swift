import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct LeftUpperChest: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 29.2135, y: 7.5000))
            p.addLine(to: CGPoint(x: 51.6854, y: 0.0000))
            p.addLine(to: CGPoint(x: 74.1573, y: 20.0000))
            p.addLine(to: CGPoint(x: 100.0000, y: 42.5000))
            p.addLine(to: CGPoint(x: 100.0000, y: 76.2500))
            p.addLine(to: CGPoint(x: 92.1348, y: 76.2500))
            p.addLine(to: CGPoint(x: 87.6404, y: 48.7500))
            p.addLine(to: CGPoint(x: 61.7978, y: 36.2500))
            p.addLine(to: CGPoint(x: 46.0674, y: 18.7500))
            p.addLine(to: CGPoint(x: 26.9663, y: 20.0000))
            p.addLine(to: CGPoint(x: 13.4831, y: 47.5000))
            p.addLine(to: CGPoint(x: 20.2247, y: 60.0000))
            p.addLine(to: CGPoint(x: 65.1685, y: 86.2500))
            p.addLine(to: CGPoint(x: 78.6517, y: 100.0000))
            p.addLine(to: CGPoint(x: 50.5618, y: 97.5000))
            p.addLine(to: CGPoint(x: 12.3596, y: 77.5000))
            p.addLine(to: CGPoint(x: 0.0000, y: 53.7500))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 29.2135, y: 15.0000))
            p.addLine(to: CGPoint(x: 48.3146, y: 10.0000))
            p.addLine(to: CGPoint(x: 62.9213, y: 25.0000))
            p.addLine(to: CGPoint(x: 87.6404, y: 41.2500))
            p.move(to: CGPoint(x: 91.0112, y: 52.5000))
            p.addLine(to: CGPoint(x: 87.6404, y: 72.5000))
            p.addLine(to: CGPoint(x: 101.1236, y: 76.2500))
            p.addEllipse(in: CGRect(x: 17.9775, y: 52.5000, width: 7.8652, height: 8.7500))
        }
    }
    private var light: Path {
        Path { p in

        }
    }
    private var shade: Path {
        Path { p in
            p.move(to: CGPoint(x: 0.0000, y: 53.7500))
            p.addLine(to: CGPoint(x: 12.3596, y: 77.5000))
            p.addLine(to: CGPoint(x: 50.5618, y: 97.5000))
            p.addLine(to: CGPoint(x: 78.6517, y: 100.0000))
            p.addLine(to: CGPoint(x: 69.6629, y: 92.5000))
            p.addLine(to: CGPoint(x: 51.6854, y: 92.5000))
            p.addLine(to: CGPoint(x: 15.7303, y: 73.7500))
            p.addLine(to: CGPoint(x: 4.4944, y: 53.7500))
            p.closeSubpath()
        }
    }
    var body: some View {
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 10)
    }
}


#Preview {
    LeftUpperChest()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
