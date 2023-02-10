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
        VStack(spacing: 0) {
            ZStack(alignment: .topLeading) {
                ListView()

                if vm.selectedTab == .map {
                    MapView()
                        .opacity(1)
                }

                TabBarView(tabBarSelection: $vm.selectedTab)
                    .padding(.bottom)
                    .ignoresSafeArea(.keyboard)
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
