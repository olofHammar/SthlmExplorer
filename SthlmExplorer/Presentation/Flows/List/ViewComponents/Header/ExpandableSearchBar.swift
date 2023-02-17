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

    @State private var isAnimating = false
    @FocusState private var isFocused: Bool
    @Namespace private var searchBarAnimation

    private typealias MyStrings = L10n.Home.SearchBar

    var body: some View {
        HStack(spacing: 0) {
            Spacer()

            HStack(spacing: 0) {
                if isExpanded {
                    if isAnimating {
                        Image(systemImage: .magnifyingGlass)
                            .matchedGeometryEffect(id: String.searchBarIconID, in: searchBarAnimation)
                            .padding(.leading, .x1)
                            .foregroundColor(Asset.Colors.Main.gray200.swiftUIColor)

                        TextField(MyStrings.title, text: $searchText)
                            .matchedGeometryEffect(id: String.searchBarTextFieldID, in: searchBarAnimation)
                            .textStyle(.bodyL)
                            .foregroundColor(Asset.Colors.Main.black200.swiftUIColor)
                            .autocorrectionDisabled()
                            .focused($isFocused)
                    } else {
                        Spacer()
                    }

                    Button(String.empty) {
                        withAnimation {
                            isExpanded = false
                        }
                    }
                    .matchedGeometryEffect(id: String.searchBarButtonID, in: searchBarAnimation)
                    .buttonStyle(IconButtonStyle(systemImage: .xMark))
                } else {
                    Spacer()

                    Rectangle()
                        .fill(.clear)
                        .matchedGeometryEffect(id: String.searchBarTextFieldID, in: searchBarAnimation)
                        .frame(width: 0, height: 0)

                    Button(String.empty) {
                        withAnimation {
                            isExpanded = true
                        }
                    }
                    .matchedGeometryEffect(id: String.searchBarButtonID, in: searchBarAnimation)
                    .buttonStyle(IconButtonStyle(systemImage: .magnifyingGlass))
                    .overlay {
                        Image(systemImage: .magnifyingGlass)
                            .matchedGeometryEffect(id: String.searchBarIconID, in: searchBarAnimation)
                            .opacity(0)
                            .allowsHitTesting(false)
                    }
                }
            }
            .padding([.trailing, .vertical], .x1)
            .background(isExpanded ? Asset.Colors.Background.b200.swiftUIColor : .clear)
            .cornerRadius(.x4)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        .onChange(of: isExpanded) { newValue in
            if newValue {
                expandSearchBar()
            } else {
                minimizeSearchBar()
            }
        }
    }

    private func expandSearchBar() {
        withAnimation(.spring()) {
            isExpanded = true
        }
        withAnimation(.linear) {
            isAnimating = true
        }
        isFocused = true
    }

    private func minimizeSearchBar() {
        hideKeyboard()

        withAnimation(.linear) {
            isAnimating = false
        }
        withAnimation(.spring()) {
            isExpanded = false
        }
        searchText = String.empty
        isFocused = false
    }
}

struct ExpandableSearchBar_Previews: PreviewProvider {
    @FocusState static var isFocused

    static var previews: some View {
        ExpandableSearchBar(isExpanded: .constant(true), searchText: .constant("Example text"))
    }
}
