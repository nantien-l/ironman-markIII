import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct RightCollarLatch: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 100.0000, y: 16.6667))
            p.addLine(to: CGPoint(x: 44.4444, y: 0.0000))
            p.addLine(to: CGPoint(x: 0.0000, y: 41.6667))
            p.addLine(to: CGPoint(x: 11.1111, y: 100.0000))
            p.addLine(to: CGPoint(x: 77.7778, y: 100.0000))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.addEllipse(in: CGRect(x: 33.3333, y: 33.3333, width: 44.4444, height: 41.6667))
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
        SketchPlate(outline: outline, seams: seams, material: .graphite, luminous: light, shading: shade, grain: 78)
    }
}


#Preview {
    RightCollarLatch()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
