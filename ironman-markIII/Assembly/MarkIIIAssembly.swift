import SwiftUI

struct MarkIIIAssembly: View {
    @ObservedObject var state: MarkIIIState

    var body: some View {
        ZStack {
            HelmetAssembly(state: state)
            TorsoAssembly(state: state)
            LeftArmAssembly(state: state)
            RightArmAssembly(state: state)
            LeftLegAssembly(state: state)
            RightLegAssembly(state: state)
        }
        .frame(width: MarkIIILayout.canvas.width, height: MarkIIILayout.canvas.height)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .aspectRatio(MarkIIILayout.canvas.width / MarkIIILayout.canvas.height, contentMode: .fit)
    }
}
