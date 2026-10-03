import SwiftUI

struct ComponentPickerSheet: View {
    @ObservedObject var state: MarkIIIState
    @Environment(\.dismiss) private var dismiss
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
        NavigationStack {
            ZStack {
                BlueprintStyle.paper.ignoresSafeArea()
                
                VStack(spacing: 12) {
                    // Header Status
                    HStack {
                        VStack(alignment: .leading, spacing: 3) {
                            Text("COMPONENT INSPECTOR")
                                .font(.system(size: 13, weight: .bold, design: .monospaced))
                                .tracking(1.5)
                            Text("\(MarkIIILayout.parts.count) TOTAL ARMOR PLATES")
                                .font(.system(size: 8, design: .monospaced))
                                .opacity(0.6)
                        }
                        Spacer()
                        if state.selectedPartNumber != nil {
                            Button("顯示全體 (CLEAR)") {
                                state.clearPartSelection()
                            }
                            .font(.system(size: 9, weight: .bold, design: .monospaced))
                            .padding(.vertical, 5)
                            .padding(.horizontal, 10)
                            .background(Color.red.opacity(0.12), in: Capsule())
                        }
                    }
                    .padding(.horizontal)

                    // Region Filter Chips
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 6) {
                            filterChip(title: "ALL", region: nil)
                            ForEach(AssemblyRegion.allCases, id: \.self) { region in
                                filterChip(title: region.rawValue, region: region)
                            }
                        }
                        .padding(.horizontal)
                    }

                    // Search Field
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 11))
                            .opacity(0.5)
                        TextField("搜尋部件名稱或編號...", text: $searchText)
                            .font(.system(size: 11, design: .monospaced))
                        if !searchText.isEmpty {
                            Button {
                                searchText = ""
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .font(.system(size: 11))
                                    .opacity(0.5)
                            }
                        }
                    }
                    .padding(.vertical, 7)
                    .padding(.horizontal, 10)
                    .background(BlueprintStyle.ink.opacity(0.06), in: RoundedRectangle(cornerRadius: 8))
                    .padding(.horizontal)

                    // Parts List
                    ScrollView {
                        LazyVStack(spacing: 6) {
                            ForEach(filteredParts) { part in
                                let isSelected = state.selectedPartNumber == part.number
                                Button {
                                    state.selectPart(part.number)
                                } label: {
                                    HStack(spacing: 12) {
                                        Text(String(format: "#%03d", part.number))
                                            .font(.system(size: 10, weight: .bold, design: .monospaced))
                                            .foregroundStyle(isSelected ? Color.white : BlueprintStyle.ink)
                                            .padding(.vertical, 4)
                                            .padding(.horizontal, 6)
                                            .background(isSelected ? BlueprintStyle.ink : BlueprintStyle.ink.opacity(0.08), in: RoundedRectangle(cornerRadius: 4))

                                        VStack(alignment: .leading, spacing: 2) {
                                            Text(part.shortName)
                                                .font(.system(size: 11, weight: .semibold, design: .monospaced))
                                                .foregroundStyle(BlueprintStyle.ink)
                                            Text("\(part.region.rawValue)  •  \(Int(part.width))x\(Int(part.height))pt")
                                                .font(.system(size: 8, design: .monospaced))
                                                .opacity(0.65)
                                        }

                                        Spacer()

                                        if isSelected {
                                            Label("已著色", systemImage: "paintbrush.fill")
                                                .font(.system(size: 9, weight: .bold, design: .monospaced))
                                                .foregroundStyle(Color.orange)
                                        } else {
                                            Image(systemName: "square.dashed")
                                                .font(.system(size: 12))
                                                .opacity(0.4)
                                        }
                                    }
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 12)
                                    .background(isSelected ? BlueprintStyle.ink.opacity(0.12) : Color.white.opacity(0.3), in: RoundedRectangle(cornerRadius: 8))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(isSelected ? BlueprintStyle.ink : BlueprintStyle.ink.opacity(0.1), lineWidth: isSelected ? 1.5 : 0.5)
                                    )
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 20)
                    }
                }
            }
            .navigationTitle("部件檢視清單")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("完成") {
                        dismiss()
                    }
                    .font(.system(size: 11, weight: .bold, design: .monospaced))
                }
            }
        }
    }

    private func filterChip(title: String, region: AssemblyRegion?) -> some View {
        let isSelected = selectedRegion == region
        return Button {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                selectedRegion = region
            }
        } label: {
            Text(title)
                .font(.system(size: 8.5, weight: .medium, design: .monospaced))
                .padding(.vertical, 5)
                .padding(.horizontal, 9)
                .background(isSelected ? BlueprintStyle.ink : BlueprintStyle.ink.opacity(0.06), in: Capsule())
                .foregroundStyle(isSelected ? Color.white : BlueprintStyle.ink)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ComponentPickerSheet(state: MarkIIIState())
}
