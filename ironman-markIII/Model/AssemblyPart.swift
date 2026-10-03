import SwiftUI

enum AssemblyRegion: String, CaseIterable {
    case helmet = "HELMET"
    case torso = "TORSO"
    case leftArm = "LEFT ARM"
    case rightArm = "RIGHT ARM"
    case leftLeg = "LEFT LEG"
    case rightLeg = "RIGHT LEG"
}

enum EntryDirection {
    case top, left, right, bottom, settle

    var offset: CGSize {
        switch self {
        case .top: CGSize(width: 0, height: -18)
        case .left: CGSize(width: -20, height: 0)
        case .right: CGSize(width: 20, height: 0)
        case .bottom: CGSize(width: 0, height: 22)
        case .settle: CGSize(width: 0, height: -8)
        }
    }
}

struct AssemblyPart: Identifiable {
    let number: Int
    let name: String
    let shortName: String
    let region: AssemblyRegion
    let width: CGFloat
    let height: CGFloat
    let center: CGPoint
    let zIndex: Double
    let entry: EntryDirection

    var id: Int { number }
}

enum MarkIIILayout {
    static let canvas = CGSize(width: 390, height: 760)

    // Canonical centers, frame sizes, z-order, and entry motion live in this one map.
    static let parts: [AssemblyPart] = [
        .init(number: 1, name: "HelmetCrown", shortName: "CROWN", region: .helmet, width: 74, height: 35, center: CGPoint(x: 195, y: 57), zIndex: 4, entry: .top),
        .init(number: 2, name: "FacePlate", shortName: "FACE", region: .helmet, width: 58, height: 34, center: CGPoint(x: 195, y: 98), zIndex: 7, entry: .top),
        .init(number: 3, name: "LeftTemple", shortName: "L TEMPLE", region: .helmet, width: 16, height: 34, center: CGPoint(x: 155, y: 91), zIndex: 5, entry: .left),
        .init(number: 4, name: "RightTemple", shortName: "R TEMPLE", region: .helmet, width: 16, height: 34, center: CGPoint(x: 235, y: 91), zIndex: 5, entry: .right),
        .init(number: 5, name: "LeftCheek", shortName: "L CHEEK", region: .helmet, width: 25, height: 27, center: CGPoint(x: 166, y: 119), zIndex: 6, entry: .left),
        .init(number: 6, name: "RightCheek", shortName: "R CHEEK", region: .helmet, width: 25, height: 27, center: CGPoint(x: 224, y: 119), zIndex: 6, entry: .right),
        .init(number: 7, name: "ChinGuard", shortName: "CHIN", region: .helmet, width: 44, height: 15, center: CGPoint(x: 195, y: 137), zIndex: 8, entry: .top),
        .init(number: 8, name: "NeckArmor", shortName: "NECK", region: .helmet, width: 44, height: 22, center: CGPoint(x: 195, y: 157), zIndex: 2, entry: .settle),
        .init(number: 9, name: "CentralChest", shortName: "CHEST", region: .torso, width: 90, height: 67, center: CGPoint(x: 195, y: 203), zIndex: 3, entry: .settle),
        .init(number: 10, name: "LeftUpperChest", shortName: "L CHEST", region: .torso, width: 58, height: 43, center: CGPoint(x: 150, y: 177), zIndex: 2, entry: .settle),
        .init(number: 11, name: "RightUpperChest", shortName: "R CHEST", region: .torso, width: 58, height: 43, center: CGPoint(x: 240, y: 177), zIndex: 2, entry: .settle),
        .init(number: 12, name: "LeftClavicle", shortName: "L CLAVICLE", region: .torso, width: 49, height: 17, center: CGPoint(x: 151, y: 151), zIndex: 4, entry: .settle),
        .init(number: 13, name: "RightClavicle", shortName: "R CLAVICLE", region: .torso, width: 49, height: 17, center: CGPoint(x: 239, y: 151), zIndex: 4, entry: .settle),
        .init(number: 14, name: "ReactorOuterRing", shortName: "REACTOR RING", region: .torso, width: 37, height: 37, center: CGPoint(x: 195, y: 207), zIndex: 5, entry: .settle),
        .init(number: 15, name: "ReactorInnerRing", shortName: "INNER RING", region: .torso, width: 27, height: 27, center: CGPoint(x: 195, y: 207), zIndex: 6, entry: .settle),
        .init(number: 16, name: "ReactorCore", shortName: "CORE", region: .torso, width: 17, height: 17, center: CGPoint(x: 195, y: 207), zIndex: 7, entry: .settle),
        .init(number: 17, name: "LeftRibUpper", shortName: "L RIB U", region: .torso, width: 30, height: 39, center: CGPoint(x: 143, y: 246), zIndex: 2, entry: .settle),
        .init(number: 18, name: "RightRibUpper", shortName: "R RIB U", region: .torso, width: 30, height: 39, center: CGPoint(x: 247, y: 246), zIndex: 2, entry: .settle),
        .init(number: 19, name: "LeftRibLower", shortName: "L RIB L", region: .torso, width: 25, height: 36, center: CGPoint(x: 151, y: 282), zIndex: 2, entry: .settle),
        .init(number: 20, name: "RightRibLower", shortName: "R RIB L", region: .torso, width: 25, height: 36, center: CGPoint(x: 239, y: 282), zIndex: 2, entry: .settle),
        .init(number: 21, name: "UpperAb", shortName: "UPPER AB", region: .torso, width: 54, height: 24, center: CGPoint(x: 195, y: 285), zIndex: 3, entry: .settle),
        .init(number: 22, name: "MidAb", shortName: "MID AB", region: .torso, width: 50, height: 24, center: CGPoint(x: 195, y: 310), zIndex: 3, entry: .settle),
        .init(number: 23, name: "LowerAb", shortName: "LOWER AB", region: .torso, width: 58, height: 24, center: CGPoint(x: 195, y: 334), zIndex: 3, entry: .settle),
        .init(number: 24, name: "LeftWaist", shortName: "L WAIST", region: .torso, width: 31, height: 48, center: CGPoint(x: 159, y: 326), zIndex: 2, entry: .settle),
        .init(number: 25, name: "RightWaist", shortName: "R WAIST", region: .torso, width: 31, height: 48, center: CGPoint(x: 231, y: 326), zIndex: 2, entry: .settle),
        .init(number: 26, name: "PelvisCenter", shortName: "PELVIS", region: .torso, width: 69, height: 38, center: CGPoint(x: 195, y: 372), zIndex: 3, entry: .settle),
        .init(number: 27, name: "LeftHipPlate", shortName: "L HIP", region: .torso, width: 38, height: 32, center: CGPoint(x: 146, y: 382), zIndex: 4, entry: .settle),
        .init(number: 28, name: "RightHipPlate", shortName: "R HIP", region: .torso, width: 38, height: 32, center: CGPoint(x: 244, y: 382), zIndex: 4, entry: .settle),
        .init(number: 29, name: "LeftShoulderBell", shortName: "L SHOULDER", region: .leftArm, width: 49, height: 54, center: CGPoint(x: 103, y: 163), zIndex: 5, entry: .left),
        .init(number: 30, name: "LeftUpperArmOuter", shortName: "L ARM OUT", region: .leftArm, width: 26, height: 69, center: CGPoint(x: 81, y: 211), zIndex: 3, entry: .left),
        .init(number: 31, name: "LeftUpperArmInner", shortName: "L ARM IN", region: .leftArm, width: 25, height: 66, center: CGPoint(x: 106, y: 214), zIndex: 4, entry: .left),
        .init(number: 32, name: "LeftElbowJoint", shortName: "L ELBOW", region: .leftArm, width: 33, height: 25, center: CGPoint(x: 94, y: 254), zIndex: 5, entry: .left),
        .init(number: 33, name: "LeftForearmOuter", shortName: "L FOREARM", region: .leftArm, width: 39, height: 77, center: CGPoint(x: 91, y: 301), zIndex: 3, entry: .left),
        .init(number: 34, name: "LeftWristArmor", shortName: "L WRIST", region: .leftArm, width: 37, height: 23, center: CGPoint(x: 91, y: 350), zIndex: 5, entry: .left),
        .init(number: 35, name: "LeftHandPlate", shortName: "L HAND", region: .leftArm, width: 42, height: 48, center: CGPoint(x: 91, y: 383), zIndex: 4, entry: .left),
        .init(number: 36, name: "LeftPalmRepulsor", shortName: "L PALM", region: .leftArm, width: 21, height: 21, center: CGPoint(x: 91, y: 384), zIndex: 6, entry: .left),
        .init(number: 37, name: "RightShoulderBell", shortName: "R SHOULDER", region: .rightArm, width: 49, height: 54, center: CGPoint(x: 287, y: 163), zIndex: 5, entry: .right),
        .init(number: 38, name: "RightUpperArmOuter", shortName: "R ARM OUT", region: .rightArm, width: 26, height: 69, center: CGPoint(x: 309, y: 211), zIndex: 3, entry: .right),
        .init(number: 39, name: "RightUpperArmInner", shortName: "R ARM IN", region: .rightArm, width: 25, height: 66, center: CGPoint(x: 284, y: 214), zIndex: 4, entry: .right),
        .init(number: 40, name: "RightElbowJoint", shortName: "R ELBOW", region: .rightArm, width: 33, height: 25, center: CGPoint(x: 296, y: 254), zIndex: 5, entry: .right),
        .init(number: 41, name: "RightForearmOuter", shortName: "R FOREARM", region: .rightArm, width: 39, height: 77, center: CGPoint(x: 299, y: 301), zIndex: 3, entry: .right),
        .init(number: 42, name: "RightWristArmor", shortName: "R WRIST", region: .rightArm, width: 37, height: 23, center: CGPoint(x: 299, y: 350), zIndex: 5, entry: .right),
        .init(number: 43, name: "RightHandPlate", shortName: "R HAND", region: .rightArm, width: 42, height: 48, center: CGPoint(x: 299, y: 383), zIndex: 4, entry: .right),
        .init(number: 44, name: "RightPalmRepulsor", shortName: "R PALM", region: .rightArm, width: 21, height: 21, center: CGPoint(x: 299, y: 384), zIndex: 6, entry: .right),
        .init(number: 45, name: "LeftHipConnector", shortName: "L HIP CONN", region: .leftLeg, width: 34, height: 27, center: CGPoint(x: 158, y: 408), zIndex: 6, entry: .bottom),
        .init(number: 46, name: "LeftThighFrontUpper", shortName: "L THIGH U", region: .leftLeg, width: 48, height: 66, center: CGPoint(x: 157, y: 446), zIndex: 4, entry: .bottom),
        .init(number: 47, name: "LeftThighFrontLower", shortName: "L THIGH L", region: .leftLeg, width: 43, height: 57, center: CGPoint(x: 158, y: 500), zIndex: 4, entry: .bottom),
        .init(number: 48, name: "LeftThighOuter", shortName: "L THIGH OUT", region: .leftLeg, width: 25, height: 87, center: CGPoint(x: 128, y: 472), zIndex: 3, entry: .left),
        .init(number: 49, name: "LeftThighInner", shortName: "L THIGH IN", region: .leftLeg, width: 21, height: 85, center: CGPoint(x: 184, y: 473), zIndex: 5, entry: .bottom),
        .init(number: 50, name: "LeftKneeCap", shortName: "L KNEE CAP", region: .leftLeg, width: 45, height: 32, center: CGPoint(x: 157, y: 535), zIndex: 7, entry: .bottom),
        .init(number: 51, name: "LeftKneeJoint", shortName: "L KNEE JOINT", region: .leftLeg, width: 36, height: 20, center: CGPoint(x: 157, y: 555), zIndex: 3, entry: .bottom),
        .init(number: 52, name: "LeftShinUpper", shortName: "L SHIN U", region: .leftLeg, width: 43, height: 58, center: CGPoint(x: 157, y: 589), zIndex: 4, entry: .bottom),
        .init(number: 53, name: "LeftShinCenter", shortName: "L SHIN C", region: .leftLeg, width: 27, height: 72, center: CGPoint(x: 157, y: 627), zIndex: 6, entry: .bottom),
        .init(number: 54, name: "LeftShinOuter", shortName: "L SHIN OUT", region: .leftLeg, width: 21, height: 65, center: CGPoint(x: 127, y: 622), zIndex: 3, entry: .left),
        .init(number: 55, name: "LeftCalfArmor", shortName: "L CALF", region: .leftLeg, width: 37, height: 49, center: CGPoint(x: 183, y: 629), zIndex: 4, entry: .bottom),
        .init(number: 56, name: "LeftAnkleGuard", shortName: "L ANKLE", region: .leftLeg, width: 45, height: 23, center: CGPoint(x: 157, y: 669), zIndex: 6, entry: .bottom),
        .init(number: 57, name: "LeftFootUpper", shortName: "L FOOT", region: .leftLeg, width: 55, height: 24, center: CGPoint(x: 153, y: 687), zIndex: 4, entry: .bottom),
        .init(number: 58, name: "LeftToePlate", shortName: "L TOE", region: .leftLeg, width: 64, height: 18, center: CGPoint(x: 149, y: 706), zIndex: 5, entry: .bottom),
        .init(number: 59, name: "LeftHeelArmor", shortName: "L HEEL", region: .leftLeg, width: 31, height: 21, center: CGPoint(x: 180, y: 690), zIndex: 3, entry: .bottom),
        .init(number: 60, name: "RightHipConnector", shortName: "R HIP CONN", region: .rightLeg, width: 34, height: 27, center: CGPoint(x: 232, y: 408), zIndex: 6, entry: .bottom),
        .init(number: 61, name: "RightThighFrontUpper", shortName: "R THIGH U", region: .rightLeg, width: 48, height: 66, center: CGPoint(x: 233, y: 446), zIndex: 4, entry: .bottom),
        .init(number: 62, name: "RightThighFrontLower", shortName: "R THIGH L", region: .rightLeg, width: 43, height: 57, center: CGPoint(x: 232, y: 500), zIndex: 4, entry: .bottom),
        .init(number: 63, name: "RightThighOuter", shortName: "R THIGH OUT", region: .rightLeg, width: 25, height: 87, center: CGPoint(x: 262, y: 472), zIndex: 3, entry: .right),
        .init(number: 64, name: "RightThighInner", shortName: "R THIGH IN", region: .rightLeg, width: 21, height: 85, center: CGPoint(x: 206, y: 473), zIndex: 5, entry: .bottom),
        .init(number: 65, name: "RightKneeCap", shortName: "R KNEE CAP", region: .rightLeg, width: 45, height: 32, center: CGPoint(x: 233, y: 535), zIndex: 7, entry: .bottom),
        .init(number: 66, name: "RightKneeJoint", shortName: "R KNEE JOINT", region: .rightLeg, width: 36, height: 20, center: CGPoint(x: 233, y: 555), zIndex: 3, entry: .bottom),
        .init(number: 67, name: "RightShinUpper", shortName: "R SHIN U", region: .rightLeg, width: 43, height: 58, center: CGPoint(x: 233, y: 589), zIndex: 4, entry: .bottom),
        .init(number: 68, name: "RightShinCenter", shortName: "R SHIN C", region: .rightLeg, width: 27, height: 72, center: CGPoint(x: 233, y: 627), zIndex: 6, entry: .bottom),
        .init(number: 69, name: "RightShinOuter", shortName: "R SHIN OUT", region: .rightLeg, width: 21, height: 65, center: CGPoint(x: 263, y: 622), zIndex: 3, entry: .right),
        .init(number: 70, name: "RightCalfArmor", shortName: "R CALF", region: .rightLeg, width: 37, height: 49, center: CGPoint(x: 207, y: 629), zIndex: 4, entry: .bottom),
        .init(number: 71, name: "RightAnkleGuard", shortName: "R ANKLE", region: .rightLeg, width: 45, height: 23, center: CGPoint(x: 233, y: 669), zIndex: 6, entry: .bottom),
        .init(number: 72, name: "RightFootUpper", shortName: "R FOOT", region: .rightLeg, width: 55, height: 24, center: CGPoint(x: 237, y: 687), zIndex: 4, entry: .bottom),
        .init(number: 73, name: "RightToePlate", shortName: "R TOE", region: .rightLeg, width: 64, height: 18, center: CGPoint(x: 241, y: 706), zIndex: 5, entry: .bottom),
        .init(number: 74, name: "RightHeelArmor", shortName: "R HEEL", region: .rightLeg, width: 31, height: 21, center: CGPoint(x: 210, y: 690), zIndex: 3, entry: .bottom)
    ]

    static func part(_ number: Int) -> AssemblyPart { parts[number - 1] }
}
