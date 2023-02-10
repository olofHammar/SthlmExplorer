//
//  RootViewModel.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-09.
//

import Domain
import Model
import ShortcutFoundation
import SwiftUI

final class RootViewModel: ObservableObject {

    @Published var selectedTab: TabBarSelection = .list

    init() { }
}
