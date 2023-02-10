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
                ForEach(vm.locationItems) { locationItem in
                    LocationCard(location: locationItem.location)
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
