import SwiftUI

struct RightArmAssembly: View {
    @ObservedObject var state: MarkIIIState
    var body: some View { AssemblyRegionView(region: .rightArm, state: state) }
}
