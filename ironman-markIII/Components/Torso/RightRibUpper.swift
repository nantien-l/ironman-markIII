import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct RightRibUpper: View {
    private var outline: Path {
        Path { p in
            p.move(to: CGPoint(x: 83.0986, y: 0.0000))
            p.addLine(to: CGPoint(x: 52.1127, y: 11.7021))
            p.addLine(to: CGPoint(x: 25.3521, y: 46.8085))
            p.addLine(to: CGPoint(x: 0.0000, y: 100.0000))
            p.addQuadCurve(to: CGPoint(x: 98.5915, y: 53.1915), control: CGPoint(x: 53.5211, y: 81.9149))
            p.addLine(to: CGPoint(x: 100.0000, y: 28.7234))
            p.closeSubpath()
        }
    }
    private var seams: Path {
        Path { p in
            p.move(to: CGPoint(x: 92.9577, y: 32.9787))
            p.addQuadCurve(to: CGPoint(x: 15.4930, y: 76.5957), control: CGPoint(x: 53.5211, y: 52.1277))
            p.move(to: CGPoint(x: 95.7746, y: 52.1277))
            p.addQuadCurve(to: CGPoint(x: 2.8169, y: 106.3830), control: CGPoint(x: 54.9296, y: 82.9787))
        }
    }
    private var light: Path {
        Path { p in

        }
    }
    private var shade: Path {
        Path { p in
            p.move(to: CGPoint(x: 98.5915, y: 47.8723))
            p.addLine(to: CGPoint(x: 98.5915, y: 53.1915))
            p.addQuadCurve(to: CGPoint(x: 0.0000, y: 100.0000), control: CGPoint(x: 53.5211, y: 81.9149))
            p.addLine(to: CGPoint(x: 5.6338, y: 91.4894))
            p.addQuadCurve(to: CGPoint(x: 98.5915, y: 47.8723), control: CGPoint(x: 60.5634, y: 73.4043))
            p.closeSubpath()
        }
    }
    var body: some View {
        SketchPlate(outline: outline, seams: seams, material: .red, luminous: light, shading: shade, grain: 18)
    }
}


#Preview {
    RightRibUpper()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
