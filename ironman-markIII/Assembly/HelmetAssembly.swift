import SwiftUI

struct HelmetAssembly: View {
    @ObservedObject var state: MarkIIIState
    var body: some View { AssemblyRegionView(region: .helmet, state: state) }
}

extension HelmetAssembly {
    static let parts: [AssemblyPart] = [
        .init(number: 1, name: "HelmetCrown", shortName: "HELMET CROWN", region: .helmet, width: 57.0000, height: 91.8000, center: CGPoint(x: 194.7000, y: 82.9000), zIndex: 3, entry: .top),
        .init(number: 2, name: "FacePlate", shortName: "FACE PLATE", region: .helmet, width: 46.8000, height: 66.0000, center: CGPoint(x: 195.0000, y: 80.8000), zIndex: 10, entry: .faceSeal),
        .init(number: 3, name: "LeftTemple", shortName: "L TEMPLE", region: .helmet, width: 10.2000, height: 52.8000, center: CGPoint(x: 171.3000, y: 81.4000), zIndex: 5, entry: .top),
        .init(number: 4, name: "RightTemple", shortName: "R TEMPLE", region: .helmet, width: 10.2000, height: 52.8000, center: CGPoint(x: 218.7000, y: 81.4000), zIndex: 5, entry: .top),
        .init(number: 5, name: "LeftCheek", shortName: "L CHEEK", region: .helmet, width: 14.4000, height: 39.0000, center: CGPoint(x: 180.0000, y: 108.1000), zIndex: 6, entry: .top),
        .init(number: 6, name: "RightCheek", shortName: "R CHEEK", region: .helmet, width: 14.4000, height: 39.0000, center: CGPoint(x: 210.0000, y: 108.1000), zIndex: 6, entry: .top),
        .init(number: 7, name: "ChinGuard", shortName: "CHIN GUARD", region: .helmet, width: 20.4000, height: 16.8000, center: CGPoint(x: 195.0000, y: 122.2000), zIndex: 7, entry: .top),
        .init(number: 8, name: "NeckArmor", shortName: "NECK ARMOR", region: .helmet, width: 49.2000, height: 40.8000, center: CGPoint(x: 195.0000, y: 128.8000), zIndex: 2, entry: .top),
        .init(number: 75, name: "CrownInset", shortName: "CROWN INSET", region: .helmet, width: 20.4000, height: 15.0000, center: CGPoint(x: 195.0000, y: 55.9000), zIndex: 11, entry: .top),
        .init(number: 76, name: "BrowBridge", shortName: "BROW BRIDGE", region: .helmet, width: 14.4000, height: 3.6000, center: CGPoint(x: 195.0000, y: 84.4000), zIndex: 11, entry: .top),
    ]
}


#Preview {
    HelmetAssembly(state: MarkIIIState())
        .background(BlueprintStyle.paper)
}
