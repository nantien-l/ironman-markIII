import SwiftUI

struct RightLegAssembly: View {
    @ObservedObject var state: MarkIIIState
    var body: some View { AssemblyRegionView(region: .rightLeg, state: state) }
}

extension RightLegAssembly {
    static let parts: [AssemblyPart] = [
        .init(number: 60, name: "RightHipConnector", shortName: "R HIP CONNECTOR", region: .rightLeg, width: 39.6000, height: 30.6000, center: CGPoint(x: 234.6000, y: 348.7000), zIndex: 5, entry: .right),
        .init(number: 61, name: "RightThighFrontUpper", shortName: "R THIGH FRONT UPPER", region: .rightLeg, width: 43.2000, height: 51.0000, center: CGPoint(x: 233.4000, y: 384.1000), zIndex: 5, entry: .right),
        .init(number: 62, name: "RightThighFrontLower", shortName: "R THIGH FRONT LOWER", region: .rightLeg, width: 32.4000, height: 56.4000, center: CGPoint(x: 234.0000, y: 429.4000), zIndex: 5, entry: .right),
        .init(number: 63, name: "RightThighOuter", shortName: "R THIGH OUTER", region: .rightLeg, width: 18.6000, height: 118.8000, center: CGPoint(x: 254.7000, y: 412.6000), zIndex: 3, entry: .right),
        .init(number: 64, name: "RightThighInner", shortName: "R THIGH INNER", region: .rightLeg, width: 23.4000, height: 129.0000, center: CGPoint(x: 213.9000, y: 404.5000), zIndex: 4, entry: .right),
        .init(number: 65, name: "RightKneeCap", shortName: "R KNEE CAP", region: .rightLeg, width: 33.6000, height: 35.4000, center: CGPoint(x: 235.8000, y: 481.9000), zIndex: 8, entry: .right),
        .init(number: 66, name: "RightKneeJoint", shortName: "R KNEE JOINT", region: .rightLeg, width: 47.4000, height: 25.2000, center: CGPoint(x: 234.3000, y: 470.2000), zIndex: 5, entry: .right),
        .init(number: 67, name: "RightShinUpper", shortName: "R SHIN UPPER", region: .rightLeg, width: 49.2000, height: 63.0000, center: CGPoint(x: 238.2000, y: 511.3000), zIndex: 6, entry: .right),
        .init(number: 68, name: "RightShinCenter", shortName: "R SHIN CENTER", region: .rightLeg, width: 53.4000, height: 89.4000, center: CGPoint(x: 241.5000, y: 567.7000), zIndex: 5, entry: .right),
        .init(number: 69, name: "RightShinOuter", shortName: "R SHIN OUTER", region: .rightLeg, width: 19.2000, height: 57.6000, center: CGPoint(x: 258.6000, y: 604.0000), zIndex: 4, entry: .right),
        .init(number: 70, name: "RightCalfArmor", shortName: "R CALF ARMOR", region: .rightLeg, width: 21.0000, height: 61.8000, center: CGPoint(x: 226.5000, y: 602.5000), zIndex: 4, entry: .right),
        .init(number: 71, name: "RightAnkleGuard", shortName: "R ANKLE GUARD", region: .rightLeg, width: 36.0000, height: 30.0000, center: CGPoint(x: 248.4000, y: 643.6000), zIndex: 7, entry: .right),
        .init(number: 72, name: "RightFootUpper", shortName: "R FOOT UPPER", region: .rightLeg, width: 42.6000, height: 24.6000, center: CGPoint(x: 248.7000, y: 668.5000), zIndex: 6, entry: .bottom),
        .init(number: 73, name: "RightToePlate", shortName: "R TOE PLATE", region: .rightLeg, width: 46.8000, height: 27.0000, center: CGPoint(x: 250.8000, y: 687.7000), zIndex: 7, entry: .bottom),
        .init(number: 74, name: "RightHeelArmor", shortName: "R HEEL ARMOR", region: .rightLeg, width: 6.0000, height: 49.8000, center: CGPoint(x: 230.4000, y: 676.3000), zIndex: 3, entry: .bottom),
        .init(number: 104, name: "RightKneeSideHinge", shortName: "R KNEE SIDE HINGE", region: .rightLeg, width: 7.8000, height: 12.0000, center: CGPoint(x: 213.3000, y: 474.4000), zIndex: 9, entry: .right),
    ]
}


#Preview {
    RightLegAssembly(state: MarkIIIState())
        .background(BlueprintStyle.paper)
}
