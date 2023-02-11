//
//  ListView.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-10.
//

import ShortcutFoundation
import SwiftUI

struct ListView: View {
    @InjectObject var vm: ListViewModel

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .center, spacing: .x2) {
                ForEach(vm.listItems, id: \.self) { item in
                    switch item {
                      case .location(let locationItem):
                          Button {
//                              hideKeyboard()
//                              vm.viewStateManager.showSelectedDetail(for: locationItem)
                          } label: {
                              LocationCard(location: locationItem.location, isFavorite: vm.favoriteBinding(locationItem))
                          }
                          .buttonStyle(PlainButtonStyle())
                      case .travelTip(let travelTip):
                        Text(travelTip.title)
//                          TravelTipCardView(travelTip: travelTip)
                      }
                }
            }
            .padding(.horizontal, .x2)
        }
    }
}
 
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
