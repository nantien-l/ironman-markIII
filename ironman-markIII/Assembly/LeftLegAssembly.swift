import SwiftUI

struct LeftLegAssembly: View {
    @ObservedObject var state: MarkIIIState
    var body: some View { AssemblyRegionView(region: .leftLeg, state: state) }
}

extension LeftLegAssembly {
    static let parts: [AssemblyPart] = [
        .init(number: 45, name: "LeftHipConnector", shortName: "L HIP CONNECTOR", region: .leftLeg, width: 39.6000, height: 30.6000, center: CGPoint(x: 155.4000, y: 348.7000), zIndex: 5, entry: .left),
        .init(number: 46, name: "LeftThighFrontUpper", shortName: "L THIGH FRONT UPPER", region: .leftLeg, width: 43.2000, height: 51.0000, center: CGPoint(x: 156.6000, y: 384.1000), zIndex: 5, entry: .left),
        .init(number: 47, name: "LeftThighFrontLower", shortName: "L THIGH FRONT LOWER", region: .leftLeg, width: 32.4000, height: 56.4000, center: CGPoint(x: 156.0000, y: 429.4000), zIndex: 5, entry: .left),
        .init(number: 48, name: "LeftThighOuter", shortName: "L THIGH OUTER", region: .leftLeg, width: 18.6000, height: 118.8000, center: CGPoint(x: 135.3000, y: 412.6000), zIndex: 3, entry: .left),
        .init(number: 49, name: "LeftThighInner", shortName: "L THIGH INNER", region: .leftLeg, width: 23.4000, height: 129.0000, center: CGPoint(x: 176.1000, y: 404.5000), zIndex: 4, entry: .left),
        .init(number: 50, name: "LeftKneeCap", shortName: "L KNEE CAP", region: .leftLeg, width: 33.6000, height: 35.4000, center: CGPoint(x: 154.2000, y: 481.9000), zIndex: 8, entry: .left),
        .init(number: 51, name: "LeftKneeJoint", shortName: "L KNEE JOINT", region: .leftLeg, width: 47.4000, height: 25.2000, center: CGPoint(x: 155.7000, y: 470.2000), zIndex: 5, entry: .left),
        .init(number: 52, name: "LeftShinUpper", shortName: "L SHIN UPPER", region: .leftLeg, width: 49.2000, height: 63.0000, center: CGPoint(x: 151.8000, y: 511.3000), zIndex: 6, entry: .left),
        .init(number: 53, name: "LeftShinCenter", shortName: "L SHIN CENTER", region: .leftLeg, width: 53.4000, height: 89.4000, center: CGPoint(x: 148.5000, y: 567.7000), zIndex: 5, entry: .left),
        .init(number: 54, name: "LeftShinOuter", shortName: "L SHIN OUTER", region: .leftLeg, width: 19.2000, height: 57.6000, center: CGPoint(x: 131.4000, y: 604.0000), zIndex: 4, entry: .left),
        .init(number: 55, name: "LeftCalfArmor", shortName: "L CALF ARMOR", region: .leftLeg, width: 21.0000, height: 61.8000, center: CGPoint(x: 163.5000, y: 602.5000), zIndex: 4, entry: .left),
        .init(number: 56, name: "LeftAnkleGuard", shortName: "L ANKLE GUARD", region: .leftLeg, width: 36.0000, height: 30.0000, center: CGPoint(x: 141.6000, y: 643.6000), zIndex: 7, entry: .left),
        .init(number: 57, name: "LeftFootUpper", shortName: "L FOOT UPPER", region: .leftLeg, width: 42.6000, height: 24.6000, center: CGPoint(x: 141.3000, y: 668.5000), zIndex: 6, entry: .bottom),
        .init(number: 58, name: "LeftToePlate", shortName: "L TOE PLATE", region: .leftLeg, width: 46.8000, height: 27.0000, center: CGPoint(x: 139.2000, y: 687.7000), zIndex: 7, entry: .bottom),
        .init(number: 59, name: "LeftHeelArmor", shortName: "L HEEL ARMOR", region: .leftLeg, width: 6.0000, height: 49.8000, center: CGPoint(x: 159.6000, y: 676.3000), zIndex: 3, entry: .bottom),
        .init(number: 103, name: "LeftKneeSideHinge", shortName: "L KNEE SIDE HINGE", region: .leftLeg, width: 7.8000, height: 12.0000, center: CGPoint(x: 176.7000, y: 474.4000), zIndex: 9, entry: .left),
    ]
}


#Preview {
    LeftLegAssembly(state: MarkIIIState())
        .background(BlueprintStyle.paper)
}
