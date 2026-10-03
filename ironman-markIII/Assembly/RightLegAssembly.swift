import SwiftUI

struct RightLegAssembly: View {
    @ObservedObject var state: MarkIIIState
    var body: some View { AssemblyRegionView(region: .rightLeg, state: state) }
}
