import SwiftUI

struct EngineeringAnnotations: View {
    @Environment(\.annotationProgress) private var progress
    @Environment(\.markIIITheme) private var theme

    var body: some View {
        ZStack {
            Path { p in
                p.move(to: CGPoint(x: 195, y: 18)); p.addLine(to: CGPoint(x: 195, y: 722))
                for y in [40.0, 126, 201, 277, 353, 429, 505, 581, 657, 707] {
                    p.move(to: CGPoint(x: 42, y: y)); p.addLine(to: CGPoint(x: 350, y: y))
                }
                p.addEllipse(in: CGRect(x: 125, y: 137, width: 140, height: 140))
                p.addEllipse(in: CGRect(x: 164, y: 37, width: 62, height: 90))
                for x in [94.0, 296] {
                    p.addEllipse(in: CGRect(x: x - 20, y: 247, width: 40, height: 40))
                }
                for x in [153.0, 237] {
                    p.addEllipse(in: CGRect(x: x - 29, y: 455, width: 58, height: 58))
                }
            }
            .trim(from: 0, to: progress)
            .stroke(theme.ink.opacity(0.14), style: StrokeStyle(lineWidth: 0.45, dash: [5, 4, 1, 4]))
            Path { p in
                p.move(to: CGPoint(x: 40, y: 40)); p.addLine(to: CGPoint(x: 30, y: 40))
                p.addLine(to: CGPoint(x: 30, y: 707)); p.addLine(to: CGPoint(x: 105, y: 707))
                p.move(to: CGPoint(x: 25, y: 45)); p.addLine(to: CGPoint(x: 35, y: 35))
                p.move(to: CGPoint(x: 25, y: 712)); p.addLine(to: CGPoint(x: 35, y: 702))
                p.move(to: CGPoint(x: 12, y: 105)); p.addLine(to: CGPoint(x: 113, y: 105)); p.addLine(to: CGPoint(x: 166, y: 76))
                p.move(to: CGPoint(x: 279, y: 113)); p.addLine(to: CGPoint(x: 343, y: 113)); p.addLine(to: CGPoint(x: 343, y: 214)); p.addLine(to: CGPoint(x: 215, y: 200))
                p.move(to: CGPoint(x: 39, y: 478)); p.addLine(to: CGPoint(x: 94, y: 478)); p.addLine(to: CGPoint(x: 148, y: 422))
                p.move(to: CGPoint(x: 264, y: 572)); p.addLine(to: CGPoint(x: 307, y: 559)); p.addLine(to: CGPoint(x: 370, y: 559))
                for point in [CGPoint(x: 166, y: 76), CGPoint(x: 215, y: 200), CGPoint(x: 148, y: 422), CGPoint(x: 264, y: 572)] {
                    p.addEllipse(in: CGRect(x: point.x - 1.6, y: point.y - 1.6, width: 3.2, height: 3.2))
                }
            }
            .trim(from: 0, to: progress)
            .stroke(theme.ink.opacity(0.48), style: StrokeStyle(lineWidth: 0.55, lineCap: .round))
            note("Ti–Au ALLOY\nFACE / REV. 03", x: 11, y: 81)
            note("ARC REACTOR\nPALLADIUM CORE", x: 280, y: 90)
            note("ARTICULATED\nFEMORAL PLATE", x: 38, y: 454)
            note("FLIGHT STABILIZER\nVECTOR / 02", x: 292, y: 534)
            Text("7.73 H / NOMINAL")
                .font(.system(size: 6, design: .monospaced)).tracking(1)
                .rotationEffect(.degrees(-90)).position(x: 19, y: 372)
            Text("ANTERIOR ELEVATION     •     SCALE 1 : 4     •     STARK / 03")
                .font(.system(size: 6, design: .monospaced)).tracking(0.7)
                .position(x: 195, y: 22)
        }
        .foregroundStyle(theme.ink.opacity(0.65))
        .allowsHitTesting(false)
        .accessibilityHidden(true)
    }

    private func note(_ text: String, x: CGFloat, y: CGFloat) -> some View {
        Text(text).font(.system(size: 6.2, weight: .medium, design: .monospaced))
            .tracking(0.5).lineSpacing(3)
            .frame(width: 105, height: 28, alignment: .topLeading)
            .position(x: x + 52.5, y: y + 14)
            .opacity(progress)
    }
}
