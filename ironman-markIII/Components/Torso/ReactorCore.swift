import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct ReactorCore: View {
    private var outline: Path {
        Path { p in
            p.addEllipse(in: CGRect(x: 0.0000, y: 0.0000, width: 100.0000, height: 100.0000))
        }
    }
    private var seams: Path {
        Path { p in

        }
    }
    private var light: Path {
        Path { p in
            p.addEllipse(in: CGRect(x: 12.5000, y: 12.5000, width: 75.0000, height: 75.0000))
        }
    }
    private var shade: Path {
        Path { p in

        }
    }
    var body: some View {
        SketchPlate(outline: outline, seams: seams, material: .graphite, luminous: light, shading: shade, grain: 16)
    }
}


#Preview {
    ReactorCore()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
