import SwiftUI
import AppKit
import Combine

@main struct VerifyMarkIII {
    @MainActor static func main() async throws {
        let parts = MarkIIILayout.parts
        precondition(parts.count == 104)
        precondition(parts.map(\.number) == Array(1...104))
        precondition(Set(parts.map(\.name)).count == 104)
        let counts: [AssemblyRegion: Int] = [.helmet: 10, .torso: 22, .leftArm: 20, .rightArm: 20, .leftLeg: 16, .rightLeg: 16]
        for (region, count) in counts { precondition(parts.filter { $0.region == region }.count == count) }
        for p in parts {
            precondition(p.center.x - p.width / 2 >= 0 && p.center.x + p.width / 2 <= 390)
            precondition(p.center.y - p.height / 2 >= 0 && p.center.y + p.height / 2 <= 760)
        }
        let beats = SuitUpSequence.beats
        let total = SuitUpSequence.orderedParts.count
        let scheduledIDs = SuitUpSequence.orderedParts.map(\.number)
        precondition(scheduledIDs.count == parts.count && Set(scheduledIDs).count == parts.count, "Every part must be scheduled exactly once")
        precondition(beats.first!.names == ["LeftHeelArmor", "RightHeelArmor"])
        precondition(SuitUpSequence.orderedParts.last!.name == "FacePlate")
        let firstHelmet = beats.firstIndex { $0.parts.contains { $0.region == .helmet } }!
        precondition(beats[firstHelmet...].allSatisfy { $0.parts.allSatisfy { $0.region == .helmet } }, "Helmet must follow every body component")
        precondition(!SuitUpSequence.visibleIDs(through: total - 1).contains(2), "Faceplate must be absent before the last beat")
        for beat in beats where beat.names.first?.hasPrefix("Left") == true {
            precondition(beat.names.count == 2 && beat.names[1] == beat.names[0].replacingOccurrences(of: "Left", with: "Right"), "Left/right pairs must assemble together")
        }
        let state = MarkIIIState(stepDuration: .milliseconds(2), completionDelay: .milliseconds(15))
        state.previous(); precondition(state.currentStep == 0)
        state.next(); precondition(state.currentStep == 1)
        precondition(state.visiblePartIDs == [SuitUpSequence.orderedParts[0].number])
        state.previous(); precondition(state.currentStep == 0)
        var sequence: [Int] = []
        let observer = state.$currentStep.dropFirst().sink { sequence.append($0) }
        state.playAll()
        try await Task.sleep(for: .milliseconds(1600))
        let expectedTrace = Array(1...total)
        let mismatch = zip(sequence, expectedTrace).first { pair in pair.0 != pair.1 }
        let sequenceIsOrdered: Bool
        switch mismatch {
        case .none: sequenceIsOrdered = true
        case .some: sequenceIsOrdered = false
        }
        precondition(sequence.count == total && sequenceIsOrdered, "Skipped or duplicated laser trace")
        precondition(state.isComplete && state.isOnline && !state.isPlaying)
        precondition(state.assembledParts == 104)
        state.next(); precondition(state.currentStep == total)
        state.previous(); precondition(state.currentStep == total - 1 && !state.isOnline && !state.visiblePartIDs.contains(2))
        state.next(); state.reset()
        try await Task.sleep(for: .milliseconds(40))
        precondition(state.currentStep == 0 && !state.isOnline && !state.isPlaying)
        state.playAll()
        try await Task.sleep(for: .milliseconds(11))
        state.reset(); state.playAll(); state.pause()
        let stopped = state.currentStep
        try await Task.sleep(for: .milliseconds(40))
        precondition(state.currentStep == stopped && !state.isPlaying && !state.isOnline)
        state.playAll(); state.previous()
        let previous = state.currentStep
        try await Task.sleep(for: .milliseconds(40))
        precondition(state.currentStep == previous && !state.isPlaying)
        observer.cancel()
        precondition(MarkIIIState(initialStep: -1).currentStep == 0)
        precondition(MarkIIIState(initialStep: 999).currentStep == total)
        print("PASS: 104 identities, 6 regions, \(total) continuous traces, boots first, helmet last, faceplate final, bounds, controls, cancellation and delayed illumination")

        let complete = MarkIIIState(initialStep: total, completionDelay: .milliseconds(1))
        try await Task.sleep(for: .milliseconds(50))
        for (name, width, height) in [("iphone-preview", 393.0, 852.0), ("ipad-preview", 834.0, 1194.0), ("compact-preview", 375.0, 667.0), ("landscape-preview", 852.0, 393.0)] {
            let content = ContentView(state: complete).frame(width: width, height: height)
            let renderer = ImageRenderer(content: content)
            renderer.scale = 2
            guard let image = renderer.cgImage else { fatalError("ImageRenderer failed") }
            let bitmap = NSBitmapImageRep(cgImage: image)
            try bitmap.representation(using: .png, properties: [:])!.write(to: URL(fileURLWithPath: "Verification/\(name).png"))
            print("RENDER: \(name), \(width) × \(height)")
        }
        for (name, step) in [("boots-stage", 4), ("body-stage", firstHelmet), ("before-face-seal", total - 1)] {
            let renderer = ImageRenderer(content: ContentView(initialStep: step).frame(width: 393, height: 852))
            renderer.scale = 2
            guard let image = renderer.cgImage else { fatalError("Stage rendering failed") }
            let bitmap = NSBitmapImageRep(cgImage: image)
            try bitmap.representation(using: .png, properties: [:])!.write(to: URL(fileURLWithPath: "Verification/\(name).png"))
        }
    }
}
