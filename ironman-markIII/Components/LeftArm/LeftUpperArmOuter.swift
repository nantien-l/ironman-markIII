import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct LeftUpperArmOuter: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 10.8696, y: 0.0000))
            p.addLine(to: CGPoint(x: 65.2174, y: 7.7586))
            p.addLine(to: CGPoint(x: 100.0000, y: 21.5517))
            p.addLine(to: CGPoint(x: 58.6957, y: 100.0000))
            p.addLine(to: CGPoint(x: 0.0000, y: 97.4138))
            p.addLine(to: CGPoint(x: 0.0000, y: 60.3448))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 34.7826, y: 12.0690))
            p.addLine(to: CGPoint(x: 30.4348, y: 37.9310))
            p.move(to: CGPoint(x: 8.6957, y: 77.5862))
            p.addLine(to: CGPoint(x: 63.0435, y: 81.8966))
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
        SketchPlate(outline: outline, seams: seams, material: .brass, luminous: light, shading: shade, grain: 30)
    }
}


#Preview {
    LeftUpperArmOuter()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
