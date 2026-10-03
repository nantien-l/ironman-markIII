import SwiftUI

struct PaperBackground: View {
    var body: some View {
        ZStack {
            BlueprintStyle.paper
            GeometryReader { proxy in
                Path { path in
                    stride(from: 24.0, through: proxy.size.width, by: 24).forEach { x in
                        path.move(to: CGPoint(x: x, y: 0))
                        path.addLine(to: CGPoint(x: x, y: proxy.size.height))
                    }
                    stride(from: 24.0, through: proxy.size.height, by: 24).forEach { y in
                        path.move(to: CGPoint(x: 0, y: y))
                        path.addLine(to: CGPoint(x: proxy.size.width, y: y))
                    }
                }
                .stroke(BlueprintStyle.faintInk.opacity(0.32), lineWidth: 0.35)
            }
        }
        .ignoresSafeArea()
    }
}
