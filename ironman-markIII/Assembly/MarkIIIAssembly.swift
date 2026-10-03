import SwiftUI

struct MarkIIIAssembly: View {
    @ObservedObject var state: MarkIIIState
    @Environment(\.markIIITheme) private var theme

    var body: some View {
        GeometryReader { proxy in
            let scale = min(proxy.size.width / MarkIIILayout.canvas.width,
                            proxy.size.height / MarkIIILayout.canvas.height)

            ZStack {
                EngineeringAnnotations()
                    .environment(\.annotationProgress, state.isComplete ? 1 : 0)
                    .opacity(state.isComplete ? 1 : 0)
                    .animation(.easeInOut(duration: 0.85), value: state.isComplete)
                if state.showsReference {
                    ReferenceUnderlay().opacity(0.52)
                }

                // Base Sketch Layer
                ZStack {
                    ForEach(MarkIIILayout.parts) { part in
                        AssemblyPartView(part: part, visible: state.isVisible(part), selectedPartNumber: state.selectedPartNumber)
                            .zIndex(state.selectedPartNumber == part.number ? 9999 : part.zIndex)
                    }
                }
                .opacity(state.showsReference ? 0.58 : 1)

                VStack(spacing: 3) {
                    Text("MARK III").font(.system(size: 17, weight: .light, design: .serif)).tracking(5)
                    Text(state.isOnline ? "ASSEMBLY COMPLETE" : "PERSONAL ARMOR SYSTEM")
                        .font(.system(size: 5.8, weight: .medium, design: .monospaced)).tracking(1.8)
                }
                .foregroundStyle(theme.ink)
                .opacity(state.isComplete ? 1 : 0.48)
                .position(x: 195, y: 744)
            }
            .frame(width: MarkIIILayout.canvas.width, height: MarkIIILayout.canvas.height)
            .environment(\.armorOnline, state.isOnline)
            .scaleEffect(scale)
            .position(x: proxy.size.width / 2, y: proxy.size.height / 2)
        }
    }
}


#Preview {
    MarkIIIAssembly(state: MarkIIIState())
        .background(BlueprintStyle.paper)
}
