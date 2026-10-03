import SwiftUI

/// Deterministic vector fibers: no bitmap, Canvas, or per-frame randomness.
struct PaperBackground: View {
    @Environment(\.markIIITheme) private var theme
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                theme.paper
                RadialGradient(colors: [theme.ink.opacity(theme.isDark ? 0.08 : 0.30), .clear, theme.accent.opacity(0.12)], center: .center, startRadius: 20, endRadius: max(proxy.size.height, proxy.size.width) * 0.72)
                // Soft, uneven paper discoloration, also entirely vector based.
                ForEach(0..<18, id: \.self) { index in
                    let x = CGFloat((index * 137 + 41) % 997) / 997 * proxy.size.width
                    let y = CGFloat((index * 239 + 53) % 991) / 991 * proxy.size.height
                    Ellipse()
                        .fill(RadialGradient(colors: [theme.accent.opacity(0.028), .clear], center: .center, startRadius: 0, endRadius: 95))
                        .frame(width: 190, height: CGFloat(70 + index % 5 * 30))
                        .rotationEffect(.degrees(Double(index * 31)))
                        .position(x: x, y: y)
                }
                Path { path in
                    for index in 0..<4200 {
                        let x = CGFloat((index * 179 + 31) % 1009) / 1009 * proxy.size.width
                        let y = CGFloat((index * 271 + 73) % 1013) / 1013 * proxy.size.height
                        path.move(to: CGPoint(x: x, y: y))
                        path.addLine(to: CGPoint(x: x + CGFloat(index % 4) + 0.5, y: y + 0.35))
                    }
                }.stroke(theme.ink.opacity(0.055), lineWidth: 0.35)
            }
        }
        .ignoresSafeArea()
        .accessibilityHidden(true)
    }
}
