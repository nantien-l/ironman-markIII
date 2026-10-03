import SwiftUI

@main struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(initialStep: initialStep)
        }
    }

    private var initialStep: Int {
        #if DEBUG
        // Reproducible simulator snapshots; normal launches always begin at zero.
        if ProcessInfo.processInfo.arguments.contains("--assembled") { return SuitUpSequence.orderedParts.count }
        #endif
        return 0
    }
}
