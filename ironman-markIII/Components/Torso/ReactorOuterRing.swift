import SwiftUI

/// Reference-registered vector plate. Edit measurements in Scripts/TraceReference.py.
struct ReactorOuterRing: View {
    private var outline: Path {
        Path { p in
            p.addEllipse(in: CGRect(x: 0.0000, y: 0.0000, width: 100.0000, height: 100.0000))
        }
    }
    private var seams: Path {
        Path { p in
            p.addEllipse(in: CGRect(x: 5.7692, y: 5.7692, width: 88.4615, height: 88.4615))
            p.addEllipse(in: CGRect(x: 15.3846, y: 15.3846, width: 69.2308, height: 69.2308))
            p.move(to: CGPoint(x: 88.4615, y: 50.0000))
            p.addLine(to: CGPoint(x: 96.1538, y: 50.0000))
            p.move(to: CGPoint(x: 87.8772, y: 56.6788))
            p.addLine(to: CGPoint(x: 95.4527, y: 58.0145))
            p.move(to: CGPoint(x: 86.1420, y: 63.1546))
            p.addLine(to: CGPoint(x: 93.3704, y: 65.7855))
            p.move(to: CGPoint(x: 83.3087, y: 69.2308))
            p.addLine(to: CGPoint(x: 89.9704, y: 73.0769))
            p.move(to: CGPoint(x: 79.4632, y: 74.7226))
            p.addLine(to: CGPoint(x: 85.3559, y: 79.6671))
            p.move(to: CGPoint(x: 74.7226, y: 79.4632))
            p.addLine(to: CGPoint(x: 79.6671, y: 85.3559))
            p.move(to: CGPoint(x: 69.2308, y: 83.3087))
            p.addLine(to: CGPoint(x: 73.0769, y: 89.9704))
            p.move(to: CGPoint(x: 63.1546, y: 86.1420))
            p.addLine(to: CGPoint(x: 65.7855, y: 93.3704))
            p.move(to: CGPoint(x: 56.6788, y: 87.8772))
            p.addLine(to: CGPoint(x: 58.0145, y: 95.4527))
            p.move(to: CGPoint(x: 50.0000, y: 88.4615))
            p.addLine(to: CGPoint(x: 50.0000, y: 96.1538))
            p.move(to: CGPoint(x: 43.3212, y: 87.8772))
            p.addLine(to: CGPoint(x: 41.9855, y: 95.4527))
            p.move(to: CGPoint(x: 36.8454, y: 86.1420))
            p.addLine(to: CGPoint(x: 34.2145, y: 93.3704))
            p.move(to: CGPoint(x: 30.7692, y: 83.3087))
            p.addLine(to: CGPoint(x: 26.9231, y: 89.9704))
            p.move(to: CGPoint(x: 25.2774, y: 79.4632))
            p.addLine(to: CGPoint(x: 20.3329, y: 85.3559))
            p.move(to: CGPoint(x: 20.5368, y: 74.7226))
            p.addLine(to: CGPoint(x: 14.6441, y: 79.6671))
            p.move(to: CGPoint(x: 16.6913, y: 69.2308))
            p.addLine(to: CGPoint(x: 10.0296, y: 73.0769))
            p.move(to: CGPoint(x: 13.8580, y: 63.1546))
            p.addLine(to: CGPoint(x: 6.6296, y: 65.7855))
            p.move(to: CGPoint(x: 12.1228, y: 56.6788))
            p.addLine(to: CGPoint(x: 4.5473, y: 58.0145))
            p.move(to: CGPoint(x: 11.5385, y: 50.0000))
            p.addLine(to: CGPoint(x: 3.8462, y: 50.0000))
            p.move(to: CGPoint(x: 12.1228, y: 43.3212))
            p.addLine(to: CGPoint(x: 4.5473, y: 41.9855))
            p.move(to: CGPoint(x: 13.8580, y: 36.8454))
            p.addLine(to: CGPoint(x: 6.6296, y: 34.2145))
            p.move(to: CGPoint(x: 16.6913, y: 30.7692))
            p.addLine(to: CGPoint(x: 10.0296, y: 26.9231))
            p.move(to: CGPoint(x: 20.5368, y: 25.2774))
            p.addLine(to: CGPoint(x: 14.6441, y: 20.3329))
            p.move(to: CGPoint(x: 25.2774, y: 20.5368))
            p.addLine(to: CGPoint(x: 20.3329, y: 14.6441))
            p.move(to: CGPoint(x: 30.7692, y: 16.6913))
            p.addLine(to: CGPoint(x: 26.9231, y: 10.0296))
            p.move(to: CGPoint(x: 36.8454, y: 13.8580))
            p.addLine(to: CGPoint(x: 34.2145, y: 6.6296))
            p.move(to: CGPoint(x: 43.3212, y: 12.1228))
            p.addLine(to: CGPoint(x: 41.9855, y: 4.5473))
            p.move(to: CGPoint(x: 50.0000, y: 11.5385))
            p.addLine(to: CGPoint(x: 50.0000, y: 3.8462))
            p.move(to: CGPoint(x: 56.6788, y: 12.1228))
            p.addLine(to: CGPoint(x: 58.0145, y: 4.5473))
            p.move(to: CGPoint(x: 63.1546, y: 13.8580))
            p.addLine(to: CGPoint(x: 65.7855, y: 6.6296))
            p.move(to: CGPoint(x: 69.2308, y: 16.6913))
            p.addLine(to: CGPoint(x: 73.0769, y: 10.0296))
            p.move(to: CGPoint(x: 74.7226, y: 20.5368))
            p.addLine(to: CGPoint(x: 79.6671, y: 14.6441))
            p.move(to: CGPoint(x: 79.4632, y: 25.2774))
            p.addLine(to: CGPoint(x: 85.3559, y: 20.3329))
            p.move(to: CGPoint(x: 83.3087, y: 30.7692))
            p.addLine(to: CGPoint(x: 89.9704, y: 26.9231))
            p.move(to: CGPoint(x: 86.1420, y: 36.8454))
            p.addLine(to: CGPoint(x: 93.3704, y: 34.2145))
            p.move(to: CGPoint(x: 87.8772, y: 43.3212))
            p.addLine(to: CGPoint(x: 95.4527, y: 41.9855))
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
        SketchPlate(outline: outline, seams: seams, material: .graphite, luminous: light, shading: shade, grain: 14)
    }
}


#Preview {
    ReactorOuterRing()
        .frame(width: 100, height: 100)
        .padding()
        .background(BlueprintStyle.paper)
}
