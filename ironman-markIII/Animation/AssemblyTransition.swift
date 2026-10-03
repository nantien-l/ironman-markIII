import SwiftUI

enum AssemblyTransition {
    static func forPart(_ part: AssemblyPart) -> AnyTransition {
        .opacity.combined(with: .offset(part.entry.offset))
    }
}
