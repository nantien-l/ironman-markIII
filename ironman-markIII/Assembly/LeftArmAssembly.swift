import SwiftUI

struct LeftArmAssembly: View {
    @ObservedObject var state: MarkIIIState
    var body: some View { AssemblyRegionView(region: .leftArm, state: state) }
}
