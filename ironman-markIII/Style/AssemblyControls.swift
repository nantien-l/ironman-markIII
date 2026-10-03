import SwiftUI

struct AssemblyControls: View {
    @ObservedObject var state: MarkIIIState

    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 5) {
                Text("MARK III")
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                Spacer()
                Text(String(format: "%02d / 74", state.currentStep))
                    .font(.system(size: 12, weight: .semibold, design: .monospaced))
                    .contentTransition(.numericText())
            }
            .foregroundStyle(BlueprintStyle.ink)

            HStack(spacing: 10) {
                Button(action: state.previous) { Label("Previous", systemImage: "chevron.left") }
                    .disabled(state.currentStep == 0)
                Button(action: state.next) { Label("Next", systemImage: "chevron.right") }
                    .disabled(state.currentStep == 74)
                Button(action: state.reset) { Label("Reset", systemImage: "arrow.counterclockwise") }
                Button(action: state.playAll) { Label(state.isPlaying ? "Playing" : "Play All", systemImage: state.isPlaying ? "pause.fill" : "play.fill") }
                    .disabled(state.isPlaying || state.currentStep == 74)
            }
            .buttonStyle(.bordered)
            .tint(BlueprintStyle.accent)
            .font(.system(size: 11, weight: .medium))
            .labelStyle(.titleAndIcon)
        }
        .padding(14)
        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 14))
        .overlay(RoundedRectangle(cornerRadius: 14).stroke(BlueprintStyle.ink.opacity(0.16), lineWidth: 1))
        .padding(.horizontal, 16)
        .padding(.bottom, 10)
    }
}
