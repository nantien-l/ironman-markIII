import SwiftUI

struct PartPlaceholder: View {
    let number: Int
    let name: String

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                if MarkIIIDebugOptions.showBoundingBoxes {
                    Rectangle()
                        .fill(Color.clear)
                        .overlay(Rectangle().stroke(BlueprintStyle.ink.opacity(0.78), lineWidth: 0.9))
                }
                VStack(spacing: 2) {
                    if MarkIIIDebugOptions.showPartNumbers {
                        Text(String(format: "%02d", number))
                            .font(.system(size: min(11, max(7, proxy.size.width * 0.20)), weight: .bold, design: .monospaced))
                    }
                    if MarkIIIDebugOptions.showLabels {
                        Text(name)
                            .font(.system(size: min(7, max(5, proxy.size.width * 0.115)), weight: .medium, design: .monospaced))
                            .lineLimit(1)
                            .minimumScaleFactor(0.55)
                    }
                }
                .foregroundStyle(BlueprintStyle.ink)
                .padding(.horizontal, 2)
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("\(number), \(name)")
    }
}
