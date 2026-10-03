import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct LeftThighOuter: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 22.5806, y: 0.0000))
            p.addLine(to: CGPoint(x: 54.8387, y: 6.0606))
            p.addLine(to: CGPoint(x: 51.6129, y: 27.2727))
            p.addLine(to: CGPoint(x: 77.4194, y: 48.4848))
            p.addLine(to: CGPoint(x: 100.0000, y: 87.8788))
            p.addLine(to: CGPoint(x: 61.2903, y: 100.0000))
            p.addLine(to: CGPoint(x: 29.0323, y: 80.8081))
            p.addLine(to: CGPoint(x: 0.0000, y: 59.0909))
            p.addLine(to: CGPoint(x: 3.2258, y: 26.2626))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 19.3548, y: 8.5859))
            p.addLine(to: CGPoint(x: 6.4516, y: 31.8182))
            p.move(to: CGPoint(x: 19.3548, y: 66.1616))
            p.addLine(to: CGPoint(x: 54.8387, y: 77.2727))
            p.addLine(to: CGPoint(x: 45.1613, y: 85.3535))
            p.move(to: CGPoint(x: 29.0323, y: 76.7677))
            p.addLine(to: CGPoint(x: 67.7419, y: 90.4040))
        }
    }
    private var light: Path {
        Path { p in

        }
    }
    private var shade: Path {
        Path { p in
            p.move(to: CGPoint(x: 22.5806, y: 5.0505))
            p.addLine(to: CGPoint(x: 35.4839, y: 6.0606))
            p.addLine(to: CGPoint(x: 29.0323, y: 36.3636))
            p.addLine(to: CGPoint(x: 61.2903, y: 63.6364))
            p.addLine(to: CGPoint(x: 80.6452, y: 86.8687))
            p.addLine(to: CGPoint(x: 61.2903, y: 100.0000))
            p.addLine(to: CGPoint(x: 54.8387, y: 92.9293))
            p.addLine(to: CGPoint(x: 64.5161, y: 86.3636))
            p.addLine(to: CGPoint(x: 45.1613, y: 64.6465))
            p.addLine(to: CGPoint(x: 12.9032, y: 36.8687))
            p.closeSubpath()
        }
    }
    var body: some View {
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 48)
    }
}


#Preview {
    LeftThighOuter()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
