import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct CentralChest: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 5.6250, y: 0.0000))
            p.addLine(to: CGPoint(x: 31.2500, y: 14.5570))
            p.addLine(to: CGPoint(x: 41.8750, y: 20.8861))
            p.addLine(to: CGPoint(x: 58.7500, y: 20.8861))
            p.addLine(to: CGPoint(x: 68.7500, y: 14.5570))
            p.addLine(to: CGPoint(x: 94.3750, y: 0.0000))
            p.addLine(to: CGPoint(x: 100.0000, y: 17.7215))
            p.addLine(to: CGPoint(x: 88.1250, y: 40.5063))
            p.addLine(to: CGPoint(x: 79.3750, y: 63.2911))
            p.addLine(to: CGPoint(x: 74.3750, y: 84.8101))
            p.addQuadCurve(to: CGPoint(x: 25.0000, y: 84.8101), control: CGPoint(x: 50.0000, y: 100.0000))
            p.addLine(to: CGPoint(x: 20.6250, y: 63.2911))
            p.addLine(to: CGPoint(x: 11.8750, y: 40.5063))
            p.addLine(to: CGPoint(x: 0.0000, y: 17.7215))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 6.2500, y: 1.2658))
            p.addLine(to: CGPoint(x: 36.8750, y: 15.1899))
            p.move(to: CGPoint(x: 93.7500, y: 1.2658))
            p.addLine(to: CGPoint(x: 63.1250, y: 15.1899))
            p.move(to: CGPoint(x: 27.5000, y: 25.9494))
            p.addQuadCurve(to: CGPoint(x: 22.5000, y: 50.6329), control: CGPoint(x: 18.7500, y: 35.4430))
            p.move(to: CGPoint(x: 30.6250, y: 27.2152))
            p.addQuadCurve(to: CGPoint(x: 25.6250, y: 49.3671), control: CGPoint(x: 23.1250, y: 36.7089))
            p.move(to: CGPoint(x: 72.5000, y: 25.9494))
            p.addQuadCurve(to: CGPoint(x: 77.5000, y: 50.6329), control: CGPoint(x: 81.2500, y: 35.4430))
            p.move(to: CGPoint(x: 69.3750, y: 27.2152))
            p.addQuadCurve(to: CGPoint(x: 74.3750, y: 49.3671), control: CGPoint(x: 76.8750, y: 36.7089))
        }
    }
    private var light: Path {
        Path { p in

        }
    }
    private var shade: Path {
        Path { p in
            p.move(to: CGPoint(x: 0.0000, y: 17.7215))
            p.addLine(to: CGPoint(x: 11.8750, y: 40.5063))
            p.addLine(to: CGPoint(x: 20.6250, y: 63.2911))
            p.addLine(to: CGPoint(x: 25.0000, y: 84.8101))
            p.addLine(to: CGPoint(x: 27.5000, y: 83.5443))
            p.addLine(to: CGPoint(x: 23.1250, y: 62.0253))
            p.addLine(to: CGPoint(x: 14.3750, y: 39.2405))
            p.addLine(to: CGPoint(x: 3.1250, y: 17.7215))
            p.closeSubpath()
            p.move(to: CGPoint(x: 100.0000, y: 17.7215))
            p.addLine(to: CGPoint(x: 88.1250, y: 40.5063))
            p.addLine(to: CGPoint(x: 79.3750, y: 63.2911))
            p.addLine(to: CGPoint(x: 74.3750, y: 84.8101))
            p.addLine(to: CGPoint(x: 71.8750, y: 83.5443))
            p.addLine(to: CGPoint(x: 76.8750, y: 62.0253))
            p.addLine(to: CGPoint(x: 85.6250, y: 39.2405))
            p.addLine(to: CGPoint(x: 96.8750, y: 17.7215))
            p.closeSubpath()
        }
    }
    var body: some View {
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 9)
    }
}


#Preview {
    CentralChest()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
