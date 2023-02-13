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

    var focus: FocusState<Bool>.Binding

    @Namespace private var searchBarAnimation

    private typealias MyStrings = L10n.Home.SearchBar

    var body: some View {
        HStack(spacing: 0) {
            Spacer()

            HStack(spacing: 0) {
                if isExpanded {
                    Asset.Images.Icons.magnifyingglass.swiftUIImage
                        .padding(.leading, .x1)
                        .foregroundColor(Asset.Colors.Main.gray200.swiftUIColor)

                    TextField(MyStrings.title, text: $searchText)
                        .textStyle(.bodyL)
                        .foregroundColor(Asset.Colors.Main.black200.swiftUIColor)
                        .autocorrectionDisabled()
                        .focused(focus)

                    Button(String.empty) {
                        minimizeSearchBar()
                    }
                    .matchedGeometryEffect(id: String.searchBarID, in: searchBarAnimation)
                    .buttonStyle(IconButtonStyle(systemImage: "xmark"))
                } else {
                    Spacer()

                    Button(String.empty) {
                        expandSearchBar()
                    }
                    .matchedGeometryEffect(id: String.searchBarID, in: searchBarAnimation)
                    .buttonStyle(IconButtonStyle(systemImage: "magnifyingglass"))
                }
            }
            .animation(.spring(response: 0.7, dampingFraction: 0.7, blendDuration: 0.6), value: isExpanded)
            .padding([.trailing, .vertical], .x1)
            .background(isExpanded ? Asset.Colors.Background.b200.swiftUIColor : .clear)
            .cornerRadius(.x4)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
    }

    private func expandSearchBar() {
        withAnimation(.spring()) {
            isExpanded = true
        }
        focus.wrappedValue = true
    }

    private func minimizeSearchBar() {
        withAnimation(.spring()) {
            isExpanded = false
        }
        searchText = String.empty
        focus.wrappedValue = false
    }
}

struct ExpandableSearchBar_Previews: PreviewProvider {
    @FocusState static var isFocused

    static var previews: some View {
        ExpandableSearchBar(isExpanded: .constant(true), searchText: .constant("Example text"), focus: $isFocused)
    }
}
