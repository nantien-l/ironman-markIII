import SwiftUI

struct LeftArmAssembly: View {
    @ObservedObject var state: MarkIIIState
    var body: some View { AssemblyRegionView(region: .leftArm, state: state) }
}

extension LeftArmAssembly {
    static let parts: [AssemblyPart] = [
        .init(number: 29, name: "LeftShoulderBell", shortName: "L SHOULDER BELL", region: .leftArm, width: 66.0000, height: 45.0000, center: CGPoint(x: 101.0000, y: 157.5000), zIndex: 8, entry: .left),
        .init(number: 30, name: "LeftUpperArmOuter", shortName: "L UPPER ARM OUTER", region: .leftArm, width: 27.6000, height: 69.6000, center: CGPoint(x: 94.8000, y: 212.8000), zIndex: 3, entry: .left),
        .init(number: 31, name: "LeftUpperArmInner", shortName: "L UPPER ARM INNER", region: .leftArm, width: 29.4000, height: 67.2000, center: CGPoint(x: 111.9000, y: 215.2000), zIndex: 3, entry: .left),
        .init(number: 32, name: "LeftElbowJoint", shortName: "L ELBOW JOINT", region: .leftArm, width: 42.6000, height: 39.6000, center: CGPoint(x: 92.7000, y: 268.6000), zIndex: 6, entry: .left),
        .init(number: 33, name: "LeftForearmOuter", shortName: "L FOREARM OUTER", region: .leftArm, width: 42.6000, height: 90.6000, center: CGPoint(x: 81.9000, y: 307.3000), zIndex: 4, entry: .left),
        .init(number: 34, name: "LeftWristArmor", shortName: "L WRIST ARMOR", region: .leftArm, width: 25.2000, height: 31.2000, center: CGPoint(x: 69.6000, y: 352.0000), zIndex: 7, entry: .left),
        .init(number: 35, name: "LeftHandPlate", shortName: "L HAND PLATE", region: .leftArm, width: 21.0000, height: 33.0000, center: CGPoint(x: 66.3000, y: 369.7000), zIndex: 5, entry: .left),
        .init(number: 36, name: "LeftPalmRepulsor", shortName: "L PALM REPULSOR", region: .leftArm, width: 9.6000, height: 11.4000, center: CGPoint(x: 67.2000, y: 380.5000), zIndex: 7, entry: .left),
        .init(number: 79, name: "LeftShoulderPivot", shortName: "L SHOULDER PIVOT", region: .leftArm, width: 22.8000, height: 22.8000, center: CGPoint(x: 121.8000, y: 178.0000), zIndex: 7, entry: .left),
        .init(number: 81, name: "LeftBicepUpperBand", shortName: "L BICEP UPPER BAND", region: .leftArm, width: 39.0000, height: 30.6000, center: CGPoint(x: 103.5000, y: 198.7000), zIndex: 5, entry: .left),
        .init(number: 83, name: "LeftBicepLowerBand", shortName: "L BICEP LOWER BAND", region: .leftArm, width: 43.2000, height: 22.8000, center: CGPoint(x: 102.0000, y: 223.0000), zIndex: 5, entry: .left),
        .init(number: 85, name: "LeftForearmFinUpper", shortName: "L FOREARM FIN UPPER", region: .leftArm, width: 13.8000, height: 25.2000, center: CGPoint(x: 70.5000, y: 274.0000), zIndex: 8, entry: .left),
        .init(number: 87, name: "LeftForearmFinMiddle", shortName: "L FOREARM FIN MIDDLE", region: .leftArm, width: 16.8000, height: 19.2000, center: CGPoint(x: 69.0000, y: 286.0000), zIndex: 8, entry: .left),
        .init(number: 89, name: "LeftForearmFinLower", shortName: "L FOREARM FIN LOWER", region: .leftArm, width: 10.8000, height: 24.6000, center: CGPoint(x: 63.6000, y: 297.7000), zIndex: 8, entry: .left),
        .init(number: 91, name: "LeftThumbProximal", shortName: "L THUMB PROXIMAL", region: .leftArm, width: 12.0000, height: 10.8000, center: CGPoint(x: 79.8000, y: 367.0000), zIndex: 8, entry: .left),
        .init(number: 93, name: "LeftThumbDistal", shortName: "L THUMB DISTAL", region: .leftArm, width: 15.0000, height: 10.8000, center: CGPoint(x: 90.9000, y: 373.6000), zIndex: 8, entry: .left),
        .init(number: 95, name: "LeftIndexProximal", shortName: "L INDEX PROXIMAL", region: .leftArm, width: 9.6000, height: 13.2000, center: CGPoint(x: 69.6000, y: 391.0000), zIndex: 8, entry: .left),
        .init(number: 97, name: "LeftIndexDistal", shortName: "L INDEX DISTAL", region: .leftArm, width: 8.4000, height: 15.6000, center: CGPoint(x: 70.2000, y: 401.2000), zIndex: 8, entry: .left),
        .init(number: 99, name: "LeftMiddleProximal", shortName: "L MIDDLE PROXIMAL", region: .leftArm, width: 9.6000, height: 18.0000, center: CGPoint(x: 63.6000, y: 395.2000), zIndex: 7, entry: .left),
        .init(number: 101, name: "LeftMiddleDistal", shortName: "L MIDDLE DISTAL", region: .leftArm, width: 10.8000, height: 22.2000, center: CGPoint(x: 66.0000, y: 412.3000), zIndex: 8, entry: .left),
    ]
}


#Preview {
    LeftArmAssembly(state: MarkIIIState())
        .background(BlueprintStyle.paper)
}
