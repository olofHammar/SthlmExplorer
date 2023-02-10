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
        VStack(alignment: .leading) {
            ForEach(vm.locationItems) { location in
                HStack {
                    Text(location.location.title)

                    Button("Toggle") {
                        vm.toggleFavoriteLocation(for: location)
                    }
                }
                .frame(height: 60)
                .background(location.isFavorite ? .red : .white)
            }
        }
    }
}
 
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
