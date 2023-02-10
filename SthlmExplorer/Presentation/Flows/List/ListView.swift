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
        VStack {
            ForEach(vm.locationItems) { location in
                Text(location.title)
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
