import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct LeftShoulderPivot: View {
    private var outline: Path {
        Path { p in
            p.addEllipse(in: CGRect(x: 0.0000, y: 0.0000, width: 100.0000, height: 100.0000))
        }
    }
    private var seams: Path {
        Path { p in
            p.addEllipse(in: CGRect(x: 13.1579, y: 13.1579, width: 73.6842, height: 73.6842))
            p.addEllipse(in: CGRect(x: 26.3158, y: 26.3158, width: 47.3684, height: 47.3684))
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
        SketchPlate(outline: outline, seams: seams, material: .graphite, luminous: light, shading: shade, grain: 79)
    }
}


#Preview {
    LeftShoulderPivot()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
