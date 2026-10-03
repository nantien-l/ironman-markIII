import SwiftUI

struct ComponentSidebarView: View {
    @ObservedObject var state: MarkIIIState
    var dismissOnSelection = false
    @Environment(\.dismiss) private var dismiss
    @Environment(\.markIIITheme) private var theme
    @State private var searchText = ""
    @State private var selectedRegion: AssemblyRegion? = nil

    var filteredParts: [AssemblyPart] {
        MarkIIILayout.parts.filter { part in
            let matchesRegion = selectedRegion == nil || part.region == selectedRegion
            let matchesSearch = searchText.isEmpty ||
                part.name.localizedCaseInsensitiveContains(searchText) ||
                part.shortName.localizedCaseInsensitiveContains(searchText) ||
                String(part.number).contains(searchText)
            return matchesRegion && matchesSearch
        }
    }

    var body: some View {
        VStack(spacing: 10) {
            // Header Status
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text("COMPONENT INSPECTOR")
                        .font(.system(size: 11, weight: .bold, design: .monospaced))
                        .tracking(1.2)
                    Text("\(MarkIIILayout.parts.count) ARMOR PLATES")
                        .font(.system(size: 8, design: .monospaced))
                        .opacity(0.6)
                }
                Spacer()
                if state.selectedPartNumber != nil {
                    Button("顯示全體") {
                        state.clearPartSelection()
                    }
                    .font(.system(size: 8.5, weight: .bold, design: .monospaced))
                    .padding(.vertical, 4)
                    .padding(.horizontal, 8)
                    .background(theme.ink.opacity(0.12), in: Capsule())
                    .foregroundStyle(theme.ink)
                }
            }
            .padding(.horizontal, 12)
            .padding(.top, 8)

            // Region Filter Chips
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 5) {
                    filterChip(title: "ALL", region: nil)
                    ForEach(AssemblyRegion.allCases, id: \.self) { region in
                        filterChip(title: region.rawValue, region: region)
                    }
                }
                .padding(.horizontal, 12)
            }

            // Search Field
            HStack {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 10))
                    .opacity(0.5)
                TextField("搜尋部件名稱/編號...", text: $searchText)
                    .font(.system(size: 10, design: .monospaced))
                if !searchText.isEmpty {
                    Button {
                        searchText = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 10))
                            .opacity(0.5)
                    }
                }
            }
            .padding(.vertical, 5)
            .padding(.horizontal, 8)
            .background(theme.ink.opacity(0.06), in: RoundedRectangle(cornerRadius: 6))
            .foregroundStyle(theme.ink)
            .padding(.horizontal, 12)

            // Parts List
            List(selection: Binding(
                get: { state.selectedPartNumber },
                set: { number in
                    state.selectPart(number)
                    if dismissOnSelection, number != nil { dismiss() }
                }
            )) {
                ForEach(filteredParts) { part in
                    let isSelected = state.selectedPartNumber == part.number
                    HStack(spacing: 10) {
                        Text(String(format: "#%03d", part.number))
                            .font(.system(size: 9, weight: .bold, design: .monospaced))
                            .foregroundStyle(isSelected ? theme.paper : theme.ink)
                            .padding(.vertical, 3)
                            .padding(.horizontal, 5)
                            .background(isSelected ? theme.ink : theme.ink.opacity(0.08), in: RoundedRectangle(cornerRadius: 3))

                        VStack(alignment: .leading, spacing: 1) {
                            Text(part.shortName)
                                .font(.system(size: 10, weight: .semibold, design: .monospaced))
                                .foregroundStyle(theme.ink)
                            Text("\(part.region.rawValue)  •  \(Int(part.width))x\(Int(part.height))pt")
                                .font(.system(size: 7.5, design: .monospaced))
                                .opacity(0.6)
                        }

                        Spacer()

                        if isSelected {
                            Image(systemName: "paintbrush.fill")
                                .font(.system(size: 10))
                                .foregroundStyle(theme.ink)
                        } else {
                            Image(systemName: "square.dashed")
                                .font(.system(size: 10))
                                .opacity(0.35)
                        }
                    }
                    .tag(part.number)
                }
            }
            .listStyle(.sidebar)
            .tint(theme.ink)
        }
        .background(theme.paper.opacity(theme.isDark ? 0.96 : 0.4))
        .foregroundStyle(theme.ink)
    }

    private func filterChip(title: String, region: AssemblyRegion?) -> some View {
        let isSelected = selectedRegion == region
        return Button {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                selectedRegion = region
            }
        } label: {
            Text(title)
                .font(.system(size: 8, weight: .medium, design: .monospaced))
                .padding(.vertical, 4)
                .padding(.horizontal, 7)
                .background(isSelected ? theme.ink : theme.ink.opacity(0.06), in: Capsule())
                .foregroundStyle(isSelected ? theme.paper : theme.ink)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ComponentSidebarView(state: MarkIIIState())
        .frame(width: 280, height: 600)
}
