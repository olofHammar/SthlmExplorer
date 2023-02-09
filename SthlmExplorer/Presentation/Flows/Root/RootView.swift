//
//  RootView.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-09.
//

import ShortcutFoundation
import SwiftUI

struct RootView: View {
    @InjectObject var vm: RootViewModel

    private typealias MyStrings = L10n.Home.Welcome
    private typealias MyColors = Asset.Colors.Main

    var body: some View {
        VStack {
            Text(MyStrings.title)
            ForEach(vm.locationItems) { location in
                Text(location.title)
            }
        }
        .onAppear {
            vm.fetchListItems()
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
