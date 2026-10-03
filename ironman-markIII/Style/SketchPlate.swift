import SwiftUI

private struct DrawingProgressKey: EnvironmentKey { static let defaultValue: CGFloat = 1 }
private struct ArmorOnlineKey: EnvironmentKey { static let defaultValue = false }
private struct InspectorModeKey: EnvironmentKey { static let defaultValue = false }
private struct SelectedPartKey: EnvironmentKey { static let defaultValue = true }
private struct AnnotationProgressKey: EnvironmentKey { static let defaultValue: CGFloat = 0 }

extension EnvironmentValues {
    var drawingProgress: CGFloat {
        get { self[DrawingProgressKey.self] }
        set { self[DrawingProgressKey.self] = newValue }
    }
    var armorOnline: Bool {
        get { self[ArmorOnlineKey.self] }
        set { self[ArmorOnlineKey.self] = newValue }
    }
    var isInspectorMode: Bool {
        get { self[InspectorModeKey.self] }
        set { self[InspectorModeKey.self] = newValue }
    }
    var isSelectedPart: Bool {
        get { self[SelectedPartKey.self] }
        set { self[SelectedPartKey.self] = newValue }
    }
    var annotationProgress: CGFloat {
        get { self[AnnotationProgressKey.self] }
        set { self[AnnotationProgressKey.self] = newValue }
    }
}

/// Each component supplies its own paths in local 0...100 coordinates.
/// Only the regional assembly knows where the plate belongs on the figure.
struct LocalArmorShape: Shape {
    let path: Path
    func path(in rect: CGRect) -> Path {
        path.applying(CGAffineTransform(scaleX: rect.width / 100, y: rect.height / 100))
            .applying(CGAffineTransform(translationX: rect.minX, y: rect.minY))
    }
}

enum ArmorMaterial { case red, brass, graphite }

struct SketchPlate: View {
    let outline: Path
    let seams: Path
    var material: ArmorMaterial = .red
    var luminous: Path = Path()
    var shading: Path = Path()
    var grain: CGFloat = 1
    @Environment(\.drawingProgress) private var progress
    @Environment(\.armorOnline) private var online
    @Environment(\.isInspectorMode) private var isInspectorMode
    @Environment(\.isSelectedPart) private var isSelectedPart
    @Environment(\.markIIITheme) private var theme

    private var pigment: Color {
        switch material {
        case .red: Color(red: 0.48, green: 0.22, blue: 0.16)
        case .brass: Color(red: 0.63, green: 0.48, blue: 0.24)
        case .graphite: theme.ink
        }
    }

    private var vividPigment: Color {
        switch material {
        case .red: Color(red: 0.85, green: 0.15, blue: 0.15)
        case .brass: Color(red: 0.95, green: 0.75, blue: 0.25)
        case .graphite: Color(red: 0.25, green: 0.35, blue: 0.45)
        }
    }

    var body: some View {
        let shape = LocalArmorShape(path: outline)
        ZStack {
            if isInspectorMode && !isSelectedPart {
                // Faint dashed outline for unselected parts in inspector mode (虛線底圖模式)
                shape.stroke(theme.ink.opacity(0.30), style: StrokeStyle(lineWidth: 0.5, lineCap: .round, dash: [4, 3]))
                LocalArmorShape(path: seams).stroke(theme.ink.opacity(0.18), style: StrokeStyle(lineWidth: 0.35, lineCap: .round, dash: [3, 3]))
            } else if isInspectorMode && isSelectedPart {
                // Native sidebar selection stays monochrome: the selected plate
                // is identified by weight and a clean outline, never by a fill hue.
                shape.fill(theme.paper)
                LocalArmorShape(path: shading).fill(theme.ink.opacity(0.12)).clipShape(shape)
                shape.stroke(theme.ink, lineWidth: 1.15)
                LocalArmorShape(path: seams).stroke(theme.ink.opacity(0.72), lineWidth: 0.65)
                LocalArmorShape(path: luminous).fill(theme.ink.opacity(0.5))
            } else {
                // Standard hand-drawn blueprint sketch style
                shape.fill(theme.paper)
                    .opacity(Double(progress))
                shape.fill(LinearGradient(colors: [pigment.opacity(online ? 0.13 : 0.035), .clear, pigment.opacity(0.08)], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .opacity(Double(progress))
                LocalArmorShape(path: shading).fill(theme.ink.opacity(0.09))
                    .clipShape(shape).opacity(Double(progress))
                PencilHatching().trim(from: 0, to: progress)
                    .stroke(theme.ink.opacity(0.25), lineWidth: 0.28)
                    .clipShape(LocalArmorShape(path: shading)).clipShape(shape)
                PencilContour(source: outline, seed: grain).trim(from: 0, to: progress)
                    .stroke(theme.ink.opacity(0.13), lineWidth: 0.45)
                    .offset(x: 0.2, y: -0.15)
                shape.trim(from: 0, to: progress)
                    .stroke(theme.ink.opacity(0.78), style: StrokeStyle(lineWidth: 0.48, lineCap: .round, lineJoin: .round))
                if progress > 0.001 && progress < 0.995 {
                    // A narrow hot head rides the drawing trim. When one plate
                    // completes, the next plate starts immediately on the same
                    // timeline, reading as a continuous laser-cut pass.
                    shape.trim(from: max(0, progress - 0.075), to: progress)
                        .stroke((theme.isDark ? Color.cyan : Color.orange).opacity(0.95), style: StrokeStyle(lineWidth: 1.65, lineCap: .round, lineJoin: .round))
                        .shadow(color: (theme.isDark ? Color.cyan : Color.orange).opacity(0.95), radius: 3)
                    shape.trim(from: max(0, progress - 0.025), to: progress)
                        .stroke(Color.white.opacity(0.98), style: StrokeStyle(lineWidth: 0.62, lineCap: .round, lineJoin: .round))
                        .shadow(color: Color.cyan.opacity(0.95), radius: 2)
                }
                PencilContour(source: outline, seed: grain + 3).trim(from: 0, to: progress)
                    .stroke(theme.ink.opacity(0.20), style: StrokeStyle(lineWidth: 0.24, lineCap: .round, dash: [2.7, 0.65, 0.7, 0.3]))
                LocalArmorShape(path: seams).trim(from: 0, to: progress)
                    .stroke(theme.ink.opacity(0.70), style: StrokeStyle(lineWidth: 0.32, lineCap: .round, lineJoin: .round))
                LocalArmorShape(path: luminous)
                    .fill(online ? (theme.isDark ? theme.ink : Color(red: 0.77, green: 0.89, blue: 0.86)) : theme.ink.opacity(0.65))
                    .shadow(color: Color.cyan.opacity(online ? 0.32 : 0), radius: 3)
                    .opacity(Double(progress))
            }
        }
    }
}
