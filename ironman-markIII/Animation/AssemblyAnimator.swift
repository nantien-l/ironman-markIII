import SwiftUI

enum AssemblyAnimator {
    // The global clock is aligned to ironman.m4a in MarkIIIState. Each contour
    // completes just before the next begins, creating one continuous laser pass.
    nonisolated static let stepDuration: Duration = .milliseconds(840)
    static let trace = Animation.linear(duration: 0.44)
}
