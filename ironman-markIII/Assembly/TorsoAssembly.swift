import SwiftUI

struct TorsoAssembly: View {
    @ObservedObject var state: MarkIIIState
    var body: some View { AssemblyRegionView(region: .torso, state: state) }
}

extension TorsoAssembly {
    static let parts: [AssemblyPart] = [
        .init(number: 9, name: "CentralChest", shortName: "CENTRAL CHEST", region: .torso, width: 96.0000, height: 94.8000, center: CGPoint(x: 195.0000, y: 208.0000), zIndex: 5, entry: .settle),
        .init(number: 10, name: "LeftUpperChest", shortName: "L UPPER CHEST", region: .torso, width: 53.4000, height: 48.0000, center: CGPoint(x: 167.7000, y: 156.4000), zIndex: 6, entry: .settle),
        .init(number: 11, name: "RightUpperChest", shortName: "R UPPER CHEST", region: .torso, width: 53.4000, height: 48.0000, center: CGPoint(x: 222.3000, y: 156.4000), zIndex: 6, entry: .settle),
        .init(number: 12, name: "LeftClavicle", shortName: "L CLAVICLE", region: .torso, width: 53.0000, height: 42.0000, center: CGPoint(x: 145.0000, y: 129.0000), zIndex: 3, entry: .settle),
        .init(number: 13, name: "RightClavicle", shortName: "R CLAVICLE", region: .torso, width: 53.0000, height: 42.0000, center: CGPoint(x: 245.0000, y: 129.0000), zIndex: 3, entry: .settle),
        .init(number: 14, name: "ReactorOuterRing", shortName: "REACTOR OUTER RING", region: .torso, width: 31.2000, height: 31.2000, center: CGPoint(x: 195.0000, y: 200.2000), zIndex: 8, entry: .settle),
        .init(number: 15, name: "ReactorInnerRing", shortName: "REACTOR INNER RING", region: .torso, width: 19.2000, height: 19.2000, center: CGPoint(x: 195.0000, y: 200.2000), zIndex: 9, entry: .settle),
        .init(number: 16, name: "ReactorCore", shortName: "REACTOR CORE", region: .torso, width: 9.6000, height: 9.6000, center: CGPoint(x: 195.0000, y: 200.2000), zIndex: 10, entry: .settle),
        .init(number: 17, name: "LeftRibUpper", shortName: "L RIB UPPER", region: .torso, width: 42.6000, height: 56.4000, center: CGPoint(x: 149.1000, y: 200.8000), zIndex: 3, entry: .settle),
        .init(number: 18, name: "RightRibUpper", shortName: "R RIB UPPER", region: .torso, width: 42.6000, height: 56.4000, center: CGPoint(x: 240.9000, y: 200.8000), zIndex: 3, entry: .settle),
        .init(number: 19, name: "LeftRibLower", shortName: "L RIB LOWER", region: .torso, width: 42.0000, height: 48.6000, center: CGPoint(x: 149.4000, y: 232.9000), zIndex: 3, entry: .settle),
        .init(number: 20, name: "RightRibLower", shortName: "R RIB LOWER", region: .torso, width: 42.0000, height: 48.6000, center: CGPoint(x: 240.6000, y: 232.9000), zIndex: 3, entry: .settle),
        .init(number: 21, name: "UpperAb", shortName: "UPPER AB", region: .torso, width: 79.8000, height: 35.4000, center: CGPoint(x: 194.7000, y: 256.3000), zIndex: 6, entry: .settle),
        .init(number: 22, name: "MidAb", shortName: "MID AB", region: .torso, width: 79.8000, height: 51.6000, center: CGPoint(x: 194.7000, y: 283.6000), zIndex: 5, entry: .settle),
        .init(number: 23, name: "LowerAb", shortName: "LOWER AB", region: .torso, width: 68.4000, height: 39.6000, center: CGPoint(x: 195.0000, y: 308.2000), zIndex: 6, entry: .settle),
        .init(number: 24, name: "LeftWaist", shortName: "L WAIST", region: .torso, width: 21.6000, height: 51.0000, center: CGPoint(x: 151.8000, y: 282.1000), zIndex: 2, entry: .settle),
        .init(number: 25, name: "RightWaist", shortName: "R WAIST", region: .torso, width: 21.6000, height: 51.0000, center: CGPoint(x: 238.2000, y: 282.1000), zIndex: 2, entry: .settle),
        .init(number: 26, name: "PelvisCenter", shortName: "PELVIS CENTER", region: .torso, width: 54.6000, height: 61.8000, center: CGPoint(x: 195.3000, y: 357.1000), zIndex: 6, entry: .settle),
        .init(number: 27, name: "LeftHipPlate", shortName: "L HIP PLATE", region: .torso, width: 43.8000, height: 36.0000, center: CGPoint(x: 153.9000, y: 318.4000), zIndex: 7, entry: .settle),
        .init(number: 28, name: "RightHipPlate", shortName: "R HIP PLATE", region: .torso, width: 43.8000, height: 36.0000, center: CGPoint(x: 236.1000, y: 318.4000), zIndex: 7, entry: .settle),
        .init(number: 77, name: "LeftCollarLatch", shortName: "L COLLAR LATCH", region: .torso, width: 5.4000, height: 7.2000, center: CGPoint(x: 191.7000, y: 153.4000), zIndex: 9, entry: .settle),
        .init(number: 78, name: "RightCollarLatch", shortName: "R COLLAR LATCH", region: .torso, width: 5.4000, height: 7.2000, center: CGPoint(x: 198.3000, y: 153.4000), zIndex: 9, entry: .settle),
    ]
}


#Preview {
    TorsoAssembly(state: MarkIIIState())
        .background(BlueprintStyle.paper)
}
