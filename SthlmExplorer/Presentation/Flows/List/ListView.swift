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
    @FocusState private var isFocused: Bool

    var body: some View {
        ZStack(alignment: .topLeading) {
            ZStack(alignment: .topLeading) {
                HeaderTitleView(locationFilter: vm.selectedFilter, animation: listAnimation)
                    .animation(.easeInOut, value: vm.headerOffset)
                    .frame(height: .headerExpanded - .x6, alignment: .bottom)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .opacity(1.8 + vm.headerOffsetProgress())
                    .animation(vm.isPresentingExpandedSearchBar ? .none : .interactiveSpring(response: 0.7, dampingFraction: 0.7, blendDuration: 0.6).delay(0.2), value: vm.isPresentingExpandedSearchBar)
                    .overlay(alignment: .bottom) {
                        ExpandableSearchBar(isExpanded: $vm.isPresentingExpandedSearchBar, searchText: $vm.searchBarText)
                            .padding(.trailing, .x1)
                    }

                HeaderFilterView(selectedFilter: $vm.selectedFilter, animation: listAnimation)
            }
            .padding(.leading, .x2)
            .frame(height: .headerExpanded + .x1)
            .background(Asset.Colors.Background.b100.swiftUIColor.shadow(color: .gray, radius: .x3))
            .offset(y: vm.headerOffsetValue())
            .zIndex(1)
            

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
                                        LocationCardView(location: locationItem.location, isFavorite: vm.favoriteBinding(locationItem))
                                    case .travelTip(let travelTip):
                                        TravelTipCardView(travelTip: travelTip)
                                    }
                                }
                            }
                            .padding(.top, vm.isPresentingExpandedSearchBar ? .headerCollapsed : .headerExpanded)
                            .padding(.top, .x4)
                            .padding(.horizontal, .x2)
                            .padding(.bottom, .x10)
                            .modifier(ListOffsetModifier(offset: $vm.headerOffset))
                        }
                    }
                }
            }
        }
        .ignoresSafeArea(edges: .top)
        .background(.thickMaterial)
    }
}
 
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
