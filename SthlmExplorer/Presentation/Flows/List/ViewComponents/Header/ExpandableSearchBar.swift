//
//  ExpandableSearchBar.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-13.
//

import SwiftUI

struct ExpandableSearchBar: View {

    @Binding var isExpanded: Bool
    @Binding var searchText: String

    @Namespace private var searchBarAnimation

    private typealias MyStrings = L10n.Home.SearchBar

    var body: some View {
        HStack(spacing: 0) {
            Spacer()

            HStack(spacing: 0) {
                if isExpanded {
                    Asset.Images.Icons.magnifyingglass.swiftUIImage
                        .padding(.leading, .x1)
                        .foregroundColor(Asset.Colors.Background.b300.swiftUIColor)

                    TextField(MyStrings.title, text: $searchText)
                        .textStyle(.bodyL)
                        .foregroundColor(Asset.Colors.Main.black200.swiftUIColor)

                    Button(String.empty) {
                        toggleSearchBarState()
                    }
                    .matchedGeometryEffect(id: String.searchBarID, in: searchBarAnimation)
                    .buttonStyle(IconButtonStyle(systemImage: "xmark"))
                } else {
                    Spacer()

                    Button(String.empty) {
                        toggleSearchBarState()
                    }
                    .matchedGeometryEffect(id: String.searchBarID, in: searchBarAnimation)
                    .buttonStyle(IconButtonStyle(systemImage: "magnifyingglass"))
                }
            }
            .animation(.spring(response: 0.7, dampingFraction: 0.7, blendDuration: 0.6), value: isExpanded)
            .padding(.trailing, .x1)
            .padding(.vertical, isExpanded ? .x1 : .x05)
            .background(isExpanded ? Asset.Colors.Background.b200.swiftUIColor : .clear)
            .cornerRadius(.x4)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
    }

    private func toggleSearchBarState() {
        withAnimation(.spring()) {
            isExpanded.toggle()
        }
    }
}

struct ExpandableSearchBar_Previews: PreviewProvider {
    @FocusState static var isFocused

    static var previews: some View {
        ExpandableSearchBar(isExpanded: .constant(false), searchText: .constant("Example text"))
    }
}
