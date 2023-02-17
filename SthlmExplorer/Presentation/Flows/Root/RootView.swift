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

    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        ZStack(alignment: .topLeading) {
            TabView(selection: $vm.selectedTab) {
                ListView()
                    .tag(TabBarSelection.list)

                MapView()
                    .tag(TabBarSelection.map)
            }

            TabBarView(tabBarSelection: $vm.selectedTab)
                .padding(.bottom, .x4)
                .ignoresSafeArea(.keyboard)
                .opacity(vm.isPresentingDetail ? 0 : 1)
        }
        .ignoresSafeArea()
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
