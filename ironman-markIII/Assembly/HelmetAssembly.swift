import SwiftUI

struct HelmetAssembly: View {
    @ObservedObject var state: MarkIIIState
    var body: some View { AssemblyRegionView(region: .helmet, state: state) }
}
