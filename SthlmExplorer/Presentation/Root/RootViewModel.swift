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
    @Inject var fetchListItemsUseCase: IFetchLocationItemsUseCase

    @Published private(set) var locationItems: [LocationItem] = []

    init() { }

    func fetchListItems() {
        fetchListItemsUseCase.execute()
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
            .assign(to: &$locationItems)
    }


}
