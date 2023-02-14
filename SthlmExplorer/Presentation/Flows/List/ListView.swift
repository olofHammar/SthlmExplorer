//
//  ListView.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-10.
//

import Model
import ShortcutFoundation
import SwiftUI

struct ListView: View {
    @InjectObject var vm: ListViewModel

    @Namespace private var topID
    @Namespace private var listAnimation

    private typealias MyStrings = L10n.Home

    var body: some View {
        ZStack(alignment: .topLeading) {
            listHeaderSection()
                .zIndex(1)

            listScrollView()
                .padding(.horizontal, .x2)
        }
        .ignoresSafeArea(edges: .top)
        .background(.thickMaterial)
    }

    @ViewBuilder
    private func listHeaderSection() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            HeaderTitleView(locationFilter: vm.selectedFilter, animation: listAnimation)
                .animation(.easeInOut, value: vm.headerOffset)
                .frame(height: .headerExpanded - .filterViewHeight, alignment: .bottom)
                .frame(maxWidth: .infinity, alignment: .leading)
                .opacity(1.8 + vm.headerOffsetProgress())
                .animation(vm.isPresentingExpandedSearchBar ? .none : .interactiveSpring(response: 0.7, dampingFraction: 0.7, blendDuration: 0.6).delay(0.2), value: vm.isPresentingExpandedSearchBar)
                .overlay(alignment: .bottom) {
                    ExpandableSearchBar(
                        isExpanded: $vm.isPresentingExpandedSearchBar,
                        searchText: $vm.searchBarText
                    )
                    .padding(.trailing, .x1)
                }

            HeaderFilterView(selectedFilter: $vm.selectedFilter, animation: listAnimation)
        }
        .padding([.leading, .top], .x2)
        .frame(height: .headerExpanded)
        .background(
            Asset.Colors.Background.b100.swiftUIColor
                .padding(.horizontal, -.x2)
                .shadow(color: Asset.Colors.Main.black400.swiftUIColor, radius: 12, x: 0, y: 5)
        )
        .offset(y: vm.headerOffsetValue())
    }

    @ViewBuilder
    private func listScrollView() -> some View {
        Group {
            if vm.isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                ScrollViewReader { reader in
                    ScrollView(showsIndicators: false) {
                        Divider()
                            .foregroundColor(.clear)
                            .id(topID)

                        VStack(alignment: .center, spacing: .x4) {
                            ForEach(vm.listItems) { item in
                                switch item {
                                case .location(let locationItem):
                                    LocationCardView(location: locationItem.location,
                                                     isFavorite: vm.favoriteBinding(locationItem))
                                case .travelTip(let travelTip):
                                    TravelTipCardView(travelTip: travelTip)
                                }
                            }
                        }
                        .padding(.top, .x4)
                        .padding(.top, vm.isPresentingExpandedSearchBar ? .headerCollapsed : .headerExpanded)
                        .padding(.bottom, .x10)
                        .modifier(ListOffsetModifier(offset: $vm.headerOffset))
                    }
                }
            }
        }
    }

    @ViewBuilder
    private func emptyStateView(with message: String) -> some View {
        Text(message)
            .textStyle(.bodyL)
            .multilineTextAlignment(.center)
            .foregroundColor(Asset.Colors.Main.gray200.swiftUIColor)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
