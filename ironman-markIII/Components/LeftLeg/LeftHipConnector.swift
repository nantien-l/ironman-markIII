import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct LeftHipConnector: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 1.5152, y: 0.0000))
            p.addLine(to: CGPoint(x: 28.7879, y: 13.7255))
            p.addLine(to: CGPoint(x: 84.8485, y: 19.6078))
            p.addLine(to: CGPoint(x: 100.0000, y: 80.3922))
            p.addLine(to: CGPoint(x: 60.6061, y: 100.0000))
            p.addLine(to: CGPoint(x: 0.0000, y: 80.3922))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 27.2727, y: 9.8039))
            p.addLine(to: CGPoint(x: 28.7879, y: 21.5686))
            p.addLine(to: CGPoint(x: 81.8182, y: 21.5686))
            p.move(to: CGPoint(x: 92.4242, y: 35.2941))
            p.addLine(to: CGPoint(x: 104.5455, y: 80.3922))
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
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 45)
    }
}


#Preview {
    LeftHipConnector()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
