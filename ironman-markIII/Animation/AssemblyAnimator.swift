import SwiftUI

enum AssemblyAnimator {
    static let stepDuration: Duration = .milliseconds(110)
    static let spring = Animation.spring(response: 0.38, dampingFraction: 0.82)
}
