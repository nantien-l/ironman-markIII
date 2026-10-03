import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct RightWristArmor: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 83.3333, y: 0.0000))
            p.addLine(to: CGPoint(x: 23.8095, y: 26.9231))
            p.addLine(to: CGPoint(x: 0.0000, y: 59.6154))
            p.addLine(to: CGPoint(x: 28.5714, y: 100.0000))
            p.addLine(to: CGPoint(x: 78.5714, y: 78.8462))
            p.addLine(to: CGPoint(x: 100.0000, y: 51.9231))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 88.0952, y: 17.3077))
            p.addLine(to: CGPoint(x: 35.7143, y: 42.3077))
            p.addLine(to: CGPoint(x: 19.0476, y: 63.4615))
            p.addLine(to: CGPoint(x: 38.0952, y: 84.6154))
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
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 42)
    }
}


#Preview {
    RightWristArmor()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
