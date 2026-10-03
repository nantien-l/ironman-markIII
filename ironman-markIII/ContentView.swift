import SwiftUI

struct ContentView: View {
    @StateObject private var state = MarkIIIState()

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                PaperBackground()
                VStack(spacing: 0) {
                    HStack {
                        VStack(alignment: .leading, spacing: 3) {
                            Text("MARK III / BLOCKOUT")
                                .font(.system(size: 13, weight: .bold, design: .monospaced))
                                .tracking(1.2)
                            Text("ENGINEERING ASSEMBLY · PHASE 01")
                                .font(.system(size: 8, weight: .medium, design: .monospaced))
                                .tracking(0.8)
                                .opacity(0.65)
                        }
                        Spacer()
                        Text("01—74")
                            .font(.system(size: 10, weight: .medium, design: .monospaced))
                    }
                    .foregroundStyle(BlueprintStyle.ink)
                    .padding(.horizontal, 20)
                    .padding(.top, 12)

                    MarkIIIAssembly(state: state)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)

                    AssemblyControls(state: state)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
        .preferredColorScheme(.light)
    }
}

#Preview {
    ContentView()
}
