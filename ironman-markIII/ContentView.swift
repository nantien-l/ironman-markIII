import SwiftUI

struct ContentView: View {
    @StateObject private var state: MarkIIIState
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @State private var columnVisibility: NavigationSplitViewVisibility = .automatic
    @State private var showComponentMenu = false
    @State private var theme: MarkIIITheme = .light

    init(initialStep: Int = 0) {
        _state = StateObject(wrappedValue: MarkIIIState(initialStep: initialStep))
    }

    init(state: MarkIIIState) {
        _state = StateObject(wrappedValue: state)
    }

    var body: some View {
        Group {
            if horizontalSizeClass == .compact {
                // On iPhone, keep the canvas as the launch surface. A split view
                // otherwise presents its sidebar first and hides Play All.
                armorDetail
            } else {
                NavigationSplitView(columnVisibility: $columnVisibility) {
                    ComponentSidebarView(state: state)
                        .navigationTitle("部件")
                } detail: {
                    armorDetail
                }
                .navigationSplitViewStyle(.balanced)
            }
        }
        .sheet(isPresented: $showComponentMenu) {
            NavigationStack {
                ComponentSidebarView(state: state, dismissOnSelection: true)
                    .navigationTitle("部件")
            }
        }
        .environment(\.markIIITheme, theme)
    }

    private var armorDetail: some View {
        ZStack {
            PaperBackground()
            VStack(spacing: 0) {
                // Header Bar
                HStack(alignment: .top) {
                    Button {
                        if horizontalSizeClass == .compact {
                            showComponentMenu = true
                        } else {
                            withAnimation(.easeInOut(duration: 0.22)) {
                                columnVisibility = .all
                            }
                        }
                    } label: {
                        Image(systemName: "sidebar.leading")
                            .font(.system(size: 14, weight: .semibold))
                            .frame(width: 30, height: 30)
                    }
                    .buttonStyle(.glass)
                    .buttonBorderShape(.circle)
                    .accessibilityIdentifier("ComponentSidebar")
                    .accessibilityLabel("部件選單")

                    VStack(alignment: .leading, spacing: 3) {
                        Text("STARK INDUSTRIES").font(.system(size: 11, weight: .semibold, design: .monospaced)).tracking(2)
                        Text("ADVANCED WEAPONS DIVISION / PRIVATE STUDY")
                            .font(.system(size: 6.5, design: .monospaced)).tracking(0.55).opacity(0.62)
                    }
                    Spacer()
                    VStack(alignment: .trailing, spacing: 4) {
                        Text("MK. III / 003").font(.system(size: 8, design: .monospaced))
                        HStack(spacing: 5) {
                            Button {
                                state.showsReference.toggle()
                            } label: {
                                Label(state.showsReference ? "底圖 ON" : "對照底圖", systemImage: "square.2.layers.3d")
                                    .font(.system(size: 9, weight: .medium))
                            }
                            .buttonStyle(.glass)
                            Button {
                                withAnimation(.easeInOut(duration: 0.2)) { theme = theme.toggled }
                            } label: {
                                Image(systemName: theme.isDark ? "sun.max" : "moon.stars")
                                    .font(.system(size: 10, weight: .semibold))
                            }
                            .buttonStyle(.glass)
                            .accessibilityIdentifier("ThemeToggle")
                        }
                        .accessibilityIdentifier("ReferenceToggle")
                        .accessibilityLabel("對照底圖")
                        .accessibilityValue(state.showsReference ? "開啟" : "關閉")
                    }
                }
                .padding(.horizontal, 16).padding(.top, 8).padding(.bottom, 2)

                // Active Part Inspector Banner
                if let partNum = state.selectedPartNumber {
                    let part = MarkIIILayout.part(partNum)
                    HStack(spacing: 8) {
                        Image(systemName: "scope")
                            .font(.system(size: 10))
                            .foregroundStyle(theme.ink)
                        Text("檢視部件: #\(String(format: "%03d", part.number)) \(part.shortName)")
                            .font(.system(size: 9, weight: .bold, design: .monospaced))
                        Text("[\(part.region.rawValue)]")
                            .font(.system(size: 8, design: .monospaced))
                            .opacity(0.65)
                        Spacer()
                        Button {
                            state.clearPartSelection()
                        } label: {
                            Text("顯示全體")
                                .font(.system(size: 8, weight: .bold, design: .monospaced))
                                .padding(.vertical, 3)
                                .padding(.horizontal, 6)
                            .background(theme.ink.opacity(0.1), in: Capsule())
                        }
                        .buttonStyle(.borderless)
                    }
                    .padding(.vertical, 4)
                    .padding(.horizontal, 10)
                    .background(theme.paper.opacity(theme.isDark ? 0.9 : 0.7), in: RoundedRectangle(cornerRadius: 6))
                    .overlay(RoundedRectangle(cornerRadius: 6).stroke(theme.ink.opacity(0.2), lineWidth: 0.5))
                    .padding(.horizontal, 16)
                    .padding(.bottom, 2)
                    .transition(.move(edge: .top).combined(with: .opacity))
                }

                // MAIN ASSEMBLY CANVAS
                MarkIIIAssembly(state: state)
                    .padding(.horizontal, 4)

                // BOTTOM CONTROLS
                AssemblyControls(state: state)
            }
            .frame(maxWidth: 920)
        }
        .foregroundStyle(theme.ink)
        .preferredColorScheme(theme.isDark ? .dark : .light)
        .onDisappear { state.pause() }
    }
}

#Preview("iPhone · completed", traits: .fixedLayout(width: 393, height: 852)) {
    ContentView(initialStep: SuitUpSequence.orderedParts.count)
}

#Preview("iPad · engineering sheet", traits: .fixedLayout(width: 834, height: 1194)) {
    ContentView(initialStep: SuitUpSequence.orderedParts.count)
}

#Preview("Assembly · ready", traits: .fixedLayout(width: 375, height: 667)) {
    ContentView()
}
