import SwiftUI
import Combine

@MainActor
final class MarkIIIState: ObservableObject {
    @Published private(set) var currentStep: Int
    @Published private(set) var isPlaying = false
    @Published private(set) var isOnline = false
    @Published var showsReference = false
    @Published var selectedPartNumber: Int? = nil

    var isInspectorMode: Bool { selectedPartNumber != nil }

    private var playbackTask: Task<Void, Never>?
    private var completionTask: Task<Void, Never>?
    private var generation = 0
    private let stepDuration: Duration
    private let completionDelay: Duration
    private let usesAudioTimeline: Bool
    var totalSteps: Int { SuitUpSequence.orderedParts.count }
    var visiblePartIDs: Set<Int> { SuitUpSequence.visibleIDs(through: currentStep) }
    var assembledParts: Int { visiblePartIDs.count }
    func isVisible(_ part: AssemblyPart) -> Bool { visiblePartIDs.contains(part.number) }
    var isComplete: Bool { currentStep == totalSteps }

    init(initialStep: Int = 0,
         stepDuration: Duration = AssemblyAnimator.stepDuration,
         completionDelay: Duration = .milliseconds(1050)) {
        self.stepDuration = stepDuration
        self.completionDelay = completionDelay
        usesAudioTimeline = stepDuration == AssemblyAnimator.stepDuration
        currentStep = min(SuitUpSequence.orderedParts.count, max(0, initialStep))
        scheduleCompletion()
    }

    func selectPart(_ number: Int?) {
        pause()
        withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
            selectedPartNumber = number
        }
    }

    func clearPartSelection() {
        withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
            selectedPartNumber = nil
        }
    }

    func previous() {
        clearPartSelection()
        pause()
        setStep(currentStep - 1)
    }

    func next() {
        clearPartSelection()
        pause()
        setStep(currentStep + 1)
    }

    func reset() {
        clearPartSelection()
        pause()
        MarkIIIAudioPlayer.shared.stop()
        setStep(0)
    }

    func pause() {
        generation += 1
        playbackTask?.cancel()
        playbackTask = nil
        isPlaying = false
        MarkIIIAudioPlayer.shared.pause()
    }

    func playAll() {
        clearPartSelection()
        pause()

        // If already completed at the end, restart from step 0 automatically
        if isComplete {
            setStep(0)
        }

        isPlaying = true

        var audioUnitSeconds = 0.0
        if usesAudioTimeline {
            let totalAudioDuration = MarkIIIAudioPlayer.shared.duration
            // Leave the short tail clear for the reactor/eye reveal.
            let activeAudioDuration = max(5.0, totalAudioDuration - 3.0)
            let totalTimingUnits = Double(totalSteps + 2)
            let completedUnits: Double = currentStep < totalSteps - 2
                ? Double(currentStep)
                : (currentStep == totalSteps - 2 ? Double(currentStep) + 1.0 : Double(currentStep) + 2.0)
            let progressFraction = completedUnits / totalTimingUnits
            MarkIIIAudioPlayer.shared.play(from: progressFraction * (activeAudioDuration / totalAudioDuration))

            let remainingUnits = totalTimingUnits - completedUnits
            audioUnitSeconds = remainingUnits > 0
                ? activeAudioDuration * (1.0 - progressFraction) / remainingUnits
                : 0.8396
        }

        let token = generation
        playbackTask = Task { @MainActor [weak self] in
            while let self, !Task.isCancelled, self.generation == token, !self.isComplete {
                self.setStep(self.currentStep + 1)

                // Leave a breath before the mask, then let the mechanical seal settle.
                let isFinalApproach = self.currentStep >= self.totalSteps - 1
                let hold: Duration
                if self.usesAudioTimeline {
                    let holdMultiplier = isFinalApproach ? 1.8 : 1.0
                    hold = .milliseconds(max(50, Int(audioUnitSeconds * holdMultiplier * 1000)))
                } else {
                    hold = self.stepDuration
                }

                do { try await Task.sleep(for: hold) }
                catch { return }
            }
            guard let self, self.generation == token, !Task.isCancelled else { return }
            self.isPlaying = false
            self.playbackTask = nil
        }
    }

    private func setStep(_ step: Int) {
        currentStep = min(totalSteps, max(0, step))
        scheduleCompletion()
    }

    private func scheduleCompletion() {
        completionTask?.cancel()
        completionTask = nil
        isOnline = false
        guard isComplete else { return }
        completionTask = Task { @MainActor [weak self, completionDelay] in
            do { try await Task.sleep(for: completionDelay) }
            catch { return }
            guard let self, !Task.isCancelled, self.isComplete else { return }
            withAnimation(.easeInOut(duration: 1.2)) { self.isOnline = true }
        }
    }

    deinit {
        playbackTask?.cancel()
        completionTask?.cancel()
    }
}
