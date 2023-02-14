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

    @Namespace var animation
    
    private typealias MyStrings = L10n.Home.Welcome
    private typealias MyColors = Asset.Colors.Main

    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        ZStack(alignment: .topLeading) {
            TabView(selection: $vm.selectedTab) {
                ListView(parentAnimation: animation)
                    .tag(TabBarSelection.list)

                MapView()
                    .tag(TabBarSelection.map)
            }

            TabBarView(tabBarSelection: $vm.selectedTab)
                .padding(.bottom, .x4)
                .ignoresSafeArea(.keyboard)

            if let selectedLocation = vm.selectedLocation, vm.isPresentingDetail {
                LocationDetailView(locationItem: selectedLocation, animation: animation)
            }
        }
        .ignoresSafeArea()
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
