import SwiftUI

struct ReactorCore: View {
    var body: some View {
        PartPlaceholder(
            number: 16,
            name: MarkIIILayout.part(16).shortName
        )
    }
}
