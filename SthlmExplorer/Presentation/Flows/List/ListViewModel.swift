//
//  ListViewModel.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-10.
//

import Model
import Domain
import ShortcutFoundation
import SwiftUI

final class ListViewModel: ObservableObject {
    @Inject var fetchListItemsUseCase: IFetchLocationItemsUseCase

    @Published private(set) var locationItems: [LocationItem] = []

    init() {
        fetchListItems()
    }

    func fetchListItems() {
        fetchListItemsUseCase.execute()
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
            .assign(to: &$locationItems)
    }
}
