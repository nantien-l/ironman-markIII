import SwiftUI

struct FacePlate: View {
    var body: some View {
        PartPlaceholder(
            number: 2,
            name: MarkIIILayout.part(2).shortName
        )
    }
}
