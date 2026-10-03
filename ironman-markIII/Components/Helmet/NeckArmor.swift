import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct NeckArmor: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 0.0000, y: 0.0000))
            p.addLine(to: CGPoint(x: 26.8293, y: 41.1765))
            p.addLine(to: CGPoint(x: 40.2439, y: 54.4118))
            p.addLine(to: CGPoint(x: 59.7561, y: 54.4118))
            p.addLine(to: CGPoint(x: 75.6098, y: 38.2353))
            p.addLine(to: CGPoint(x: 98.7805, y: 4.4118))
            p.addLine(to: CGPoint(x: 100.0000, y: 66.1765))
            p.addLine(to: CGPoint(x: 78.0488, y: 82.3529))
            p.addLine(to: CGPoint(x: 48.7805, y: 100.0000))
            p.addLine(to: CGPoint(x: 19.5122, y: 82.3529))
            p.addLine(to: CGPoint(x: 0.0000, y: 70.5882))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 10.9756, y: 26.4706))
            p.addLine(to: CGPoint(x: 12.1951, y: 72.0588))
            p.addLine(to: CGPoint(x: 32.9268, y: 86.7647))
            p.move(to: CGPoint(x: 89.0244, y: 26.4706))
            p.addLine(to: CGPoint(x: 87.8049, y: 72.0588))
            p.addLine(to: CGPoint(x: 67.0732, y: 86.7647))
            p.move(to: CGPoint(x: 30.4878, y: 48.5294))
            p.addLine(to: CGPoint(x: 35.3659, y: 79.4118))
            p.addLine(to: CGPoint(x: 50.0000, y: 89.7059))
            p.addLine(to: CGPoint(x: 63.4146, y: 77.9412))
            p.addLine(to: CGPoint(x: 69.5122, y: 48.5294))
            p.move(to: CGPoint(x: 40.2439, y: 57.3529))
            p.addLine(to: CGPoint(x: 41.4634, y: 76.4706))
            p.addLine(to: CGPoint(x: 50.0000, y: 83.8235))
            p.addLine(to: CGPoint(x: 57.3171, y: 76.4706))
            p.addLine(to: CGPoint(x: 59.7561, y: 57.3529))
            p.move(to: CGPoint(x: 41.4634, y: 58.8235))
            p.addQuadCurve(to: CGPoint(x: 58.5366, y: 58.8235), control: CGPoint(x: 50.0000, y: 66.1765))
            p.move(to: CGPoint(x: 41.4634, y: 64.7059))
            p.addQuadCurve(to: CGPoint(x: 58.5366, y: 64.7059), control: CGPoint(x: 50.0000, y: 72.0588))
            p.move(to: CGPoint(x: 41.4634, y: 70.5882))
            p.addQuadCurve(to: CGPoint(x: 58.5366, y: 70.5882), control: CGPoint(x: 50.0000, y: 77.9412))
            p.move(to: CGPoint(x: 41.4634, y: 76.4706))
            p.addQuadCurve(to: CGPoint(x: 58.5366, y: 76.4706), control: CGPoint(x: 50.0000, y: 83.8235))
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
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 8)
    }
}


#Preview {
    NeckArmor()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
