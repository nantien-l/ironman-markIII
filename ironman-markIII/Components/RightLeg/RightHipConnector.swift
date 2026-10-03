import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct RightHipConnector: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 98.4848, y: 0.0000))
            p.addLine(to: CGPoint(x: 71.2121, y: 13.7255))
            p.addLine(to: CGPoint(x: 15.1515, y: 19.6078))
            p.addLine(to: CGPoint(x: 0.0000, y: 80.3922))
            p.addLine(to: CGPoint(x: 39.3939, y: 100.0000))
            p.addLine(to: CGPoint(x: 100.0000, y: 80.3922))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 72.7273, y: 9.8039))
            p.addLine(to: CGPoint(x: 71.2121, y: 21.5686))
            p.addLine(to: CGPoint(x: 18.1818, y: 21.5686))
            p.move(to: CGPoint(x: 7.5758, y: 35.2941))
            p.addLine(to: CGPoint(x: -4.5455, y: 80.3922))
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
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 60)
    }
}


#Preview {
    RightHipConnector()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
