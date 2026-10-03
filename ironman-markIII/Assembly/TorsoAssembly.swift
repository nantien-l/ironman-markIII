import SwiftUI

struct TorsoAssembly: View {
    @ObservedObject var state: MarkIIIState
    var body: some View { AssemblyRegionView(region: .torso, state: state) }
}
