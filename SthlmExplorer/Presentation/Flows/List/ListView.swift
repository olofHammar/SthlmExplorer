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
                ForEach(vm.listItems) { item in
                    switch item {
                    case .location(let locationItem):
                        LocationCardView(location: locationItem.location, isFavorite: vm.favoriteBinding(locationItem))
                    case .travelTip(let travelTip):
                        TravelTipCardView(travelTip: travelTip)
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
