import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct LeftBicepLowerBand: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 5.5556, y: 2.6316))
            p.addLine(to: CGPoint(x: 63.8889, y: 21.0526))
            p.addLine(to: CGPoint(x: 100.0000, y: 0.0000))
            p.addLine(to: CGPoint(x: 94.4444, y: 78.9474))
            p.addLine(to: CGPoint(x: 51.3889, y: 100.0000))
            p.addLine(to: CGPoint(x: 0.0000, y: 76.3158))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 1.3889, y: 71.0526))
            p.addLine(to: CGPoint(x: 52.7778, y: 86.8421))
            p.addLine(to: CGPoint(x: 95.8333, y: 71.0526))
        }
    }
    private var light: Path {
        Path { p in

        }
    }
    private var shade: Path {
        Path { p in
            p.move(to: CGPoint(x: 0.0000, y: 65.7895))
            p.addLine(to: CGPoint(x: 52.7778, y: 86.8421))
            p.addLine(to: CGPoint(x: 95.8333, y: 65.7895))
            p.addLine(to: CGPoint(x: 94.4444, y: 78.9474))
            p.addLine(to: CGPoint(x: 51.3889, y: 100.0000))
            p.addLine(to: CGPoint(x: 0.0000, y: 76.3158))
            p.closeSubpath()
        }
    }
    var body: some View {
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 83)
    }
}


#Preview {
    LeftBicepLowerBand()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
