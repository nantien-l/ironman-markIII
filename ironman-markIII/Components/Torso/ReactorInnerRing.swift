import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct ReactorInnerRing: View {
    private var outline: Path {
        Path { p in
            p.addEllipse(in: CGRect(x: 0.0000, y: 0.0000, width: 100.0000, height: 100.0000))
        }
    }
    private var seams: Path {
        Path { p in
            p.addEllipse(in: CGRect(x: 9.3750, y: 9.3750, width: 81.2500, height: 81.2500))
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
        SketchPlate(outline: outline, seams: seams, material: .brass, luminous: light, shading: shade, grain: 15)
    }
}


#Preview {
    ReactorInnerRing()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
