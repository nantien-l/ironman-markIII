import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct RightBicepLowerBand: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 94.4444, y: 2.6316))
            p.addLine(to: CGPoint(x: 36.1111, y: 21.0526))
            p.addLine(to: CGPoint(x: 0.0000, y: 0.0000))
            p.addLine(to: CGPoint(x: 5.5556, y: 78.9474))
            p.addLine(to: CGPoint(x: 48.6111, y: 100.0000))
            p.addLine(to: CGPoint(x: 100.0000, y: 76.3158))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 98.6111, y: 71.0526))
            p.addLine(to: CGPoint(x: 47.2222, y: 86.8421))
            p.addLine(to: CGPoint(x: 4.1667, y: 71.0526))
        }
    }
    private var light: Path {
        Path { p in

        }
    }
    private var shade: Path {
        Path { p in
            p.move(to: CGPoint(x: 100.0000, y: 65.7895))
            p.addLine(to: CGPoint(x: 47.2222, y: 86.8421))
            p.addLine(to: CGPoint(x: 4.1667, y: 65.7895))
            p.addLine(to: CGPoint(x: 5.5556, y: 78.9474))
            p.addLine(to: CGPoint(x: 48.6111, y: 100.0000))
            p.addLine(to: CGPoint(x: 100.0000, y: 76.3158))
            p.closeSubpath()
        }
    }
    var body: some View {
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 84)
    }
}


#Preview {
    RightBicepLowerBand()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
