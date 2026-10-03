import SwiftUI

/// Stable identity makes interrupted playback and backward steps deterministic.
struct AssemblyPartView: View {
    let part: AssemblyPart
    let visible: Bool
    let selectedPartNumber: Int?
    @State private var progress: CGFloat = 0
    @State private var hasProcessedInitialVisibility = false
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    init(part: AssemblyPart, visible: Bool, selectedPartNumber: Int? = nil) {
        self.part = part
        self.visible = visible
        self.selectedPartNumber = selectedPartNumber
        _progress = State(initialValue: visible ? 1 : 0)
    }

    var body: some View {
        let isInspectorMode = selectedPartNumber != nil
        let isSelectedPart = selectedPartNumber == part.number
        let isPartVisible = isInspectorMode ? true : visible

        PartViewFactory.view(for: part.number)
            .environment(\.drawingProgress, isInspectorMode ? 1 : progress)
            .environment(\.isInspectorMode, isInspectorMode)
            .environment(\.isSelectedPart, isSelectedPart)
            .frame(width: part.width, height: part.height)
            .opacity(isPartVisible ? 1 : 0)
            .position(part.center)
            .task(id: isPartVisible) {
                guard isPartVisible else {
                    progress = 0
                    hasProcessedInitialVisibility = true
                    return
                }

                // Completed previews and the inspector begin at their final state.
                guard hasProcessedInitialVisibility else {
                    hasProcessedInitialVisibility = true
                    progress = 1
                    return
                }

                progress = 0
                guard !reduceMotion else {
                    progress = 1
                    return
                }
                withAnimation(AssemblyAnimator.trace) {
                    progress = 1
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("\(part.number). \(part.shortName)")
            .accessibilityHidden(!isPartVisible)
    }
}
