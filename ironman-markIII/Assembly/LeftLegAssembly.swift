import SwiftUI

struct LeftLegAssembly: View {
    @ObservedObject var state: MarkIIIState
    var body: some View { AssemblyRegionView(region: .leftLeg, state: state) }
}
