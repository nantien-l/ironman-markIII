import SwiftUI

struct AssemblyRegionView: View {
    let region: AssemblyRegion
    @ObservedObject var state: MarkIIIState

    var body: some View {
        ZStack {
            ForEach(MarkIIILayout.parts.filter { $0.region == region }) { part in
                PartViewFactory.view(for: part.number)
                    .frame(width: part.width, height: part.height)
                    .position(part.center)
                    .opacity(state.currentStep >= part.number ? 1 : 0)
                    .offset(state.currentStep >= part.number ? .zero : part.entry.offset)
                    .scaleEffect(state.currentStep >= part.number ? 1 : (part.entry == .settle ? 0.96 : 1))
                    .animation(.spring(response: 0.38, dampingFraction: 0.82), value: state.currentStep >= part.number)
                    .zIndex(part.zIndex)
            }
        }
        .frame(width: MarkIIILayout.canvas.width, height: MarkIIILayout.canvas.height)
    }
}

enum PartViewFactory {
    @ViewBuilder static func view(for number: Int) -> some View {
        switch number {
        case 1: HelmetCrown()
        case 2: FacePlate()
        case 3: LeftTemple()
        case 4: RightTemple()
        case 5: LeftCheek()
        case 6: RightCheek()
        case 7: ChinGuard()
        case 8: NeckArmor()
        case 9: CentralChest()
        case 10: LeftUpperChest()
        case 11: RightUpperChest()
        case 12: LeftClavicle()
        case 13: RightClavicle()
        case 14: ReactorOuterRing()
        case 15: ReactorInnerRing()
        case 16: ReactorCore()
        case 17: LeftRibUpper()
        case 18: RightRibUpper()
        case 19: LeftRibLower()
        case 20: RightRibLower()
        case 21: UpperAb()
        case 22: MidAb()
        case 23: LowerAb()
        case 24: LeftWaist()
        case 25: RightWaist()
        case 26: PelvisCenter()
        case 27: LeftHipPlate()
        case 28: RightHipPlate()
        case 29: LeftShoulderBell()
        case 30: LeftUpperArmOuter()
        case 31: LeftUpperArmInner()
        case 32: LeftElbowJoint()
        case 33: LeftForearmOuter()
        case 34: LeftWristArmor()
        case 35: LeftHandPlate()
        case 36: LeftPalmRepulsor()
        case 37: RightShoulderBell()
        case 38: RightUpperArmOuter()
        case 39: RightUpperArmInner()
        case 40: RightElbowJoint()
        case 41: RightForearmOuter()
        case 42: RightWristArmor()
        case 43: RightHandPlate()
        case 44: RightPalmRepulsor()
        case 45: LeftHipConnector()
        case 46: LeftThighFrontUpper()
        case 47: LeftThighFrontLower()
        case 48: LeftThighOuter()
        case 49: LeftThighInner()
        case 50: LeftKneeCap()
        case 51: LeftKneeJoint()
        case 52: LeftShinUpper()
        case 53: LeftShinCenter()
        case 54: LeftShinOuter()
        case 55: LeftCalfArmor()
        case 56: LeftAnkleGuard()
        case 57: LeftFootUpper()
        case 58: LeftToePlate()
        case 59: LeftHeelArmor()
        case 60: RightHipConnector()
        case 61: RightThighFrontUpper()
        case 62: RightThighFrontLower()
        case 63: RightThighOuter()
        case 64: RightThighInner()
        case 65: RightKneeCap()
        case 66: RightKneeJoint()
        case 67: RightShinUpper()
        case 68: RightShinCenter()
        case 69: RightShinOuter()
        case 70: RightCalfArmor()
        case 71: RightAnkleGuard()
        case 72: RightFootUpper()
        case 73: RightToePlate()
        case 74: RightHeelArmor()
        default: EmptyView()
        }
    }
}
