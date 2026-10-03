import SwiftUI

struct AssemblyControls: View {
    @ObservedObject var state: MarkIIIState
    @Environment(\.markIIITheme) private var theme

    var body: some View {
        VStack(spacing: 7) {
            HStack {
                Text(status).lineLimit(1).minimumScaleFactor(0.65)
                Spacer(minLength: 8)
                Text(String(format: "%03d / %03d", state.assembledParts, MarkIIILayout.parts.count))
                    .monospacedDigit()
                    .accessibilityIdentifier("assemblyProgress")
            }
            .font(.system(size: 9, weight: .medium, design: .monospaced))
            GeometryReader { proxy in
                ZStack(alignment: .leading) {
                    Rectangle().fill(theme.ink.opacity(0.1))
                    Rectangle().fill(theme.ink.opacity(0.6))
                        .frame(width: proxy.size.width * CGFloat(state.currentStep) / CGFloat(state.totalSteps))
                }
            }.frame(height: 1)
            HStack(spacing: 0) {
                control("Reset", icon: "arrow.counterclockwise", action: state.reset)
                control("Previous", icon: "chevron.left", action: state.previous)
                    .disabled(state.currentStep == 0)
                control("Next", icon: "chevron.right", action: state.next)
                    .disabled(state.isComplete)
                control(state.isPlaying ? "Pause" : "Play All", icon: state.isPlaying ? "pause.fill" : "play.fill") {
                    if state.isPlaying { state.pause() } else { state.playAll() }
                }
                .disabled(state.isComplete && !state.isPlaying)
            }
            .buttonBorderShape(.roundedRectangle(radius: 10))
            .controlSize(.regular)
        }
        .foregroundStyle(theme.ink)
        .padding(.horizontal, 22)
        .padding(.bottom, 5)
    }

    private var status: String {
        if state.isOnline { return "J.A.R.V.I.S. / SYSTEM ONLINE" }
        if state.isComplete { return "ASSEMBLY COMPLETE / INITIALIZING" }
        guard state.currentStep > 0 else { return "\(MarkIIILayout.parts.count) PARTS / BOOTS → HELMET" }
        return SuitUpSequence.part(at: state.currentStep)?.shortName ?? "LASER TRACE / READY"
    }

    private func control(_ title: String, icon: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Label {
                Text(title).font(.system(size: 10, weight: .semibold, design: .monospaced))
            } icon: {
                Image(systemName: icon)
            }
            .frame(maxWidth: .infinity)
            .frame(maxWidth: .infinity, minHeight: 44)
        }
        .buttonStyle(.glass)
        .accessibilityLabel(title)
        .accessibilityIdentifier(title.replacingOccurrences(of: " ", with: ""))
    }
}
