import SwiftUI

struct RightArmAssembly: View {
    @ObservedObject var state: MarkIIIState
    var body: some View { AssemblyRegionView(region: .rightArm, state: state) }
}

extension RightArmAssembly {
    static let parts: [AssemblyPart] = [
        .init(number: 37, name: "RightShoulderBell", shortName: "R SHOULDER BELL", region: .rightArm, width: 66.0000, height: 45.0000, center: CGPoint(x: 289.0000, y: 157.5000), zIndex: 8, entry: .right),
        .init(number: 38, name: "RightUpperArmOuter", shortName: "R UPPER ARM OUTER", region: .rightArm, width: 27.6000, height: 69.6000, center: CGPoint(x: 295.2000, y: 212.8000), zIndex: 3, entry: .right),
        .init(number: 39, name: "RightUpperArmInner", shortName: "R UPPER ARM INNER", region: .rightArm, width: 29.4000, height: 67.2000, center: CGPoint(x: 278.1000, y: 215.2000), zIndex: 3, entry: .right),
        .init(number: 40, name: "RightElbowJoint", shortName: "R ELBOW JOINT", region: .rightArm, width: 42.6000, height: 39.6000, center: CGPoint(x: 297.3000, y: 268.6000), zIndex: 6, entry: .right),
        .init(number: 41, name: "RightForearmOuter", shortName: "R FOREARM OUTER", region: .rightArm, width: 42.6000, height: 90.6000, center: CGPoint(x: 308.1000, y: 307.3000), zIndex: 4, entry: .right),
        .init(number: 42, name: "RightWristArmor", shortName: "R WRIST ARMOR", region: .rightArm, width: 25.2000, height: 31.2000, center: CGPoint(x: 320.4000, y: 352.0000), zIndex: 7, entry: .right),
        .init(number: 43, name: "RightHandPlate", shortName: "R HAND PLATE", region: .rightArm, width: 21.0000, height: 33.0000, center: CGPoint(x: 323.7000, y: 369.7000), zIndex: 5, entry: .right),
        .init(number: 44, name: "RightPalmRepulsor", shortName: "R PALM REPULSOR", region: .rightArm, width: 9.6000, height: 11.4000, center: CGPoint(x: 322.8000, y: 380.5000), zIndex: 7, entry: .right),
        .init(number: 80, name: "RightShoulderPivot", shortName: "R SHOULDER PIVOT", region: .rightArm, width: 22.8000, height: 22.8000, center: CGPoint(x: 268.2000, y: 178.0000), zIndex: 7, entry: .right),
        .init(number: 82, name: "RightBicepUpperBand", shortName: "R BICEP UPPER BAND", region: .rightArm, width: 39.0000, height: 30.6000, center: CGPoint(x: 286.5000, y: 198.7000), zIndex: 5, entry: .right),
        .init(number: 84, name: "RightBicepLowerBand", shortName: "R BICEP LOWER BAND", region: .rightArm, width: 43.2000, height: 22.8000, center: CGPoint(x: 288.0000, y: 223.0000), zIndex: 5, entry: .right),
        .init(number: 86, name: "RightForearmFinUpper", shortName: "R FOREARM FIN UPPER", region: .rightArm, width: 13.8000, height: 25.2000, center: CGPoint(x: 319.5000, y: 274.0000), zIndex: 8, entry: .right),
        .init(number: 88, name: "RightForearmFinMiddle", shortName: "R FOREARM FIN MIDDLE", region: .rightArm, width: 16.8000, height: 19.2000, center: CGPoint(x: 321.0000, y: 286.0000), zIndex: 8, entry: .right),
        .init(number: 90, name: "RightForearmFinLower", shortName: "R FOREARM FIN LOWER", region: .rightArm, width: 10.8000, height: 24.6000, center: CGPoint(x: 326.4000, y: 297.7000), zIndex: 8, entry: .right),
        .init(number: 92, name: "RightThumbProximal", shortName: "R THUMB PROXIMAL", region: .rightArm, width: 12.0000, height: 10.8000, center: CGPoint(x: 310.2000, y: 367.0000), zIndex: 8, entry: .right),
        .init(number: 94, name: "RightThumbDistal", shortName: "R THUMB DISTAL", region: .rightArm, width: 15.0000, height: 10.8000, center: CGPoint(x: 299.1000, y: 373.6000), zIndex: 8, entry: .right),
        .init(number: 96, name: "RightIndexProximal", shortName: "R INDEX PROXIMAL", region: .rightArm, width: 9.6000, height: 13.2000, center: CGPoint(x: 320.4000, y: 391.0000), zIndex: 8, entry: .right),
        .init(number: 98, name: "RightIndexDistal", shortName: "R INDEX DISTAL", region: .rightArm, width: 8.4000, height: 15.6000, center: CGPoint(x: 319.8000, y: 401.2000), zIndex: 8, entry: .right),
        .init(number: 100, name: "RightMiddleProximal", shortName: "R MIDDLE PROXIMAL", region: .rightArm, width: 9.6000, height: 18.0000, center: CGPoint(x: 326.4000, y: 395.2000), zIndex: 7, entry: .right),
        .init(number: 102, name: "RightMiddleDistal", shortName: "R MIDDLE DISTAL", region: .rightArm, width: 10.8000, height: 22.2000, center: CGPoint(x: 324.0000, y: 412.3000), zIndex: 8, entry: .right),
    ]
}


#Preview {
    RightArmAssembly(state: MarkIIIState())
        .background(BlueprintStyle.paper)
}
