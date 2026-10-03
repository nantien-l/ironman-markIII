import SwiftUI

enum BlueprintStyle {
    static let ink = Color(red: 0.30, green: 0.26, blue: 0.21)
    static let faintInk = ink.opacity(0.12)
    static let paper = Color(red: 0.94, green: 0.90, blue: 0.80)
    static let accent = Color(red: 0.50, green: 0.36, blue: 0.22)
}

enum MarkIIITheme {
    case light, dark

    var paper: Color {
        self == .dark ? Color(red: 0.015, green: 0.035, blue: 0.075) : BlueprintStyle.paper
    }
    var ink: Color {
        self == .dark ? Color(red: 0.18, green: 0.88, blue: 1.0) : BlueprintStyle.ink
    }
    var accent: Color {
        self == .dark ? Color(red: 0.05, green: 0.35, blue: 0.65) : BlueprintStyle.accent
    }
    var isDark: Bool { self == .dark }
    var toggled: MarkIIITheme { isDark ? .light : .dark }
}

private struct MarkIIIThemeKey: EnvironmentKey {
    static let defaultValue: MarkIIITheme = .light
}

extension EnvironmentValues {
    var markIIITheme: MarkIIITheme {
        get { self[MarkIIIThemeKey.self] }
        set { self[MarkIIIThemeKey.self] = newValue }
    }
}
