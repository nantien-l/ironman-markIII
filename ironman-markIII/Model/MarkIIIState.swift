import SwiftUI
import Combine

enum MarkIIIDebugOptions {
    static let showBoundingBoxes = true
    static let showLabels = true
    static let showPartNumbers = true
}

@MainActor
final class MarkIIIState: ObservableObject {
    @Published var currentStep: Int
    @Published private(set) var isPlaying = false
    private var playbackTask: Task<Void, Never>?

    init(initialStep: Int = 0) {
        currentStep = min(74, max(0, initialStep))
    }

    func previous() {
        stopPlayback()
        currentStep = max(0, currentStep - 1)
    }

    func next() {
        stopPlayback()
        currentStep = min(74, currentStep + 1)
    }

    func reset() {
        stopPlayback()
        currentStep = 0
    }

    func playAll() {
        stopPlayback()
        guard currentStep < 74 else { return }
        isPlaying = true
        playbackTask = Task { @MainActor [weak self] in
            guard let self else { return }
            while !Task.isCancelled && currentStep < 74 {
                try? await Task.sleep(for: .milliseconds(110))
                guard !Task.isCancelled else { break }
                withAnimation(.spring(response: 0.38, dampingFraction: 0.82)) {
                    self.currentStep += 1
                }
            }
            isPlaying = false
            playbackTask = nil
        }
    }

    private func stopPlayback() {
        playbackTask?.cancel()
        playbackTask = nil
        isPlaying = false
    }
}
