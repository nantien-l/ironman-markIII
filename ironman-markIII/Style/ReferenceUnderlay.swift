import SwiftUI

/// Same registration as Scripts/TraceReference.py: front center 435, crown 116.
/// The unmodified three-view reference is clipped to its front elevation.
struct ReferenceUnderlay: View {
    var body: some View {
        Image("MarkIIIReference")
            .resizable()
            .frame(width: 1887 * 0.6, height: (1342.0 / 1900.0) * 1887 * 0.6)
            .offset(x: -66, y: -29.6)
            .frame(width: 390, height: 760, alignment: .topLeading)
            .clipped()
            .blendMode(.multiply)
            .allowsHitTesting(false)
            .accessibilityHidden(true)
    }
}
