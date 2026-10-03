import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct LeftWristArmor: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 16.6667, y: 0.0000))
            p.addLine(to: CGPoint(x: 76.1905, y: 26.9231))
            p.addLine(to: CGPoint(x: 100.0000, y: 59.6154))
            p.addLine(to: CGPoint(x: 71.4286, y: 100.0000))
            p.addLine(to: CGPoint(x: 21.4286, y: 78.8462))
            p.addLine(to: CGPoint(x: 0.0000, y: 51.9231))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 11.9048, y: 17.3077))
            p.addLine(to: CGPoint(x: 64.2857, y: 42.3077))
            p.addLine(to: CGPoint(x: 80.9524, y: 63.4615))
            p.addLine(to: CGPoint(x: 61.9048, y: 84.6154))
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
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 34)
    }
}


#Preview {
    LeftWristArmor()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
