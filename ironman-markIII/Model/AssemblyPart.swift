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
    case top, left, right, bottom, settle, faceSeal

    var offset: CGSize {
        switch self {
        case .top: CGSize(width: 0, height: -18)
        case .left: CGSize(width: -20, height: 0)
        case .right: CGSize(width: 20, height: 0)
        case .bottom: CGSize(width: 0, height: 22)
        case .settle: CGSize(width: 0, height: -8)
        case .faceSeal: CGSize(width: 0, height: -27)
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

    // Identity is independent of choreography and draw order.
    static let parts = (HelmetAssembly.parts + TorsoAssembly.parts
        + LeftArmAssembly.parts + RightArmAssembly.parts
        + LeftLegAssembly.parts + RightLegAssembly.parts).sorted { $0.number < $1.number }

    static func part(_ number: Int) -> AssemblyPart { parts[number - 1] }
}

struct AssemblyBeat {
    let title: String
    let names: [String]
    var parts: [AssemblyPart] { names.map { name in MarkIIILayout.parts.first { $0.name == name }! } }
}

enum SuitUpSequence {
    private static func pair(_ suffix: String, _ title: String) -> AssemblyBeat {
        AssemblyBeat(title: title, names: ["Left" + suffix, "Right" + suffix])
    }
    private static func single(_ name: String, _ title: String) -> AssemblyBeat {
        AssemblyBeat(title: title, names: [name])
    }

    // Mark III workshop rhythm: boots, legs, torso, arms, then helmet and face seal.
    // Paired armor locks together; the final faceplate gets its own held beat.
    static let beats: [AssemblyBeat] = [
        pair("HeelArmor", "BOOTS / HEEL BRACES"),
        pair("FootUpper", "BOOTS / INSTEP"),
        pair("ToePlate", "BOOTS / TOE LOCK"),
        pair("AnkleGuard", "ANKLES / LOCK"),
        pair("ShinOuter", "LOWER LEGS / OUTER BRACES"),
        pair("CalfArmor", "LOWER LEGS / CALF CLOSURE"),
        pair("ShinCenter", "LOWER LEGS / FRONT PLATES"),
        pair("ShinUpper", "LOWER LEGS / UPPER GREAVES"),
        pair("KneeJoint", "KNEES / ARTICULATION"),
        pair("KneeSideHinge", "KNEES / HINGE LOCK"),
        pair("KneeCap", "KNEES / CAP CLOSURE"),
        pair("ThighOuter", "THIGHS / OUTER SHELLS"),
        pair("ThighInner", "THIGHS / INNER SHELLS"),
        pair("ThighFrontLower", "THIGHS / LOWER PLATES"),
        pair("ThighFrontUpper", "THIGHS / UPPER PLATES"),
        pair("HipConnector", "HIPS / CONNECTORS"),
        single("PelvisCenter", "PELVIS / CENTER LOCK"),
        pair("HipPlate", "PELVIS / SIDE CLOSURE"),
        pair("Waist", "WAIST / SIDE BRACES"),
        single("LowerAb", "ABDOMEN / LOWER PLATE"),
        single("MidAb", "ABDOMEN / MID PLATE"),
        single("UpperAb", "ABDOMEN / UPPER PLATE"),
        pair("RibLower", "TORSO / LOWER RIBS"),
        pair("RibUpper", "TORSO / UPPER RIBS"),
        pair("Clavicle", "TORSO / COLLAR FRAME"),
        single("CentralChest", "CHEST / BREASTPLATE"),
        pair("UpperChest", "CHEST / UPPER CLOSURE"),
        pair("CollarLatch", "CHEST / COLLAR LATCHES"),
        pair("UpperArmOuter", "ARMS / OUTER BRACES"),
        pair("UpperArmInner", "ARMS / INNER BRACES"),
        pair("ShoulderPivot", "SHOULDERS / PIVOTS"),
        pair("BicepUpperBand", "ARMS / UPPER BANDS"),
        pair("BicepLowerBand", "ARMS / LOWER BANDS"),
        pair("ElbowJoint", "ELBOWS / ARTICULATION"),
        pair("ForearmOuter", "FOREARMS / SHELLS"),
        pair("ForearmFinUpper", "FOREARMS / UPPER FINS"),
        pair("ForearmFinMiddle", "FOREARMS / MID FINS"),
        pair("ForearmFinLower", "FOREARMS / LOWER FINS"),
        pair("WristArmor", "WRISTS / CUFF LOCK"),
        pair("HandPlate", "HANDS / DORSAL PLATES"),
        pair("PalmRepulsor", "HANDS / INNER LINKAGE"),
        pair("ThumbProximal", "HANDS / THUMB HINGES"),
        pair("ThumbDistal", "HANDS / THUMB TIPS"),
        pair("IndexProximal", "HANDS / INDEX HINGES"),
        pair("IndexDistal", "HANDS / INDEX TIPS"),
        pair("MiddleProximal", "HANDS / FINGER HINGES"),
        pair("MiddleDistal", "HANDS / FINGER TIPS"),
        pair("ShoulderBell", "SHOULDERS / FINAL CLOSURE"),
        single("ReactorOuterRing", "REACTOR / HOUSING"),
        single("ReactorInnerRing", "REACTOR / CONTAINMENT"),
        single("ReactorCore", "REACTOR / CORE SEATED"),
        single("NeckArmor", "HELMET / NECK SEAL"),
        single("HelmetCrown", "HELMET / REAR SHELL"),
        pair("Temple", "HELMET / TEMPLE LOCK"),
        pair("Cheek", "HELMET / CHEEK LOCK"),
        single("ChinGuard", "HELMET / JAW LOCK"),
        AssemblyBeat(title: "FACEPLATE / FINAL SEAL", names: ["CrownInset", "BrowBridge", "FacePlate"])
    ]

    /// The beat list preserves the mechanical story. The laser queue expands it
    /// to one plate at a time, so the endpoint of one traced contour hands off
    /// directly to the next instead of revealing a mirrored pair together.
    static let orderedParts: [AssemblyPart] = beats.flatMap(\.parts)

    static func visibleIDs(through step: Int) -> Set<Int> {
        Set(orderedParts.prefix(max(0, step)).map(\.number))
    }

    static func part(at step: Int) -> AssemblyPart? {
        guard step > 0, step <= orderedParts.count else { return nil }
        return orderedParts[step - 1]
    }
}
