//
//  ListViewModel.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-10.
//

import Combine
import Domain
import Model
import ShortcutFoundation
import SwiftUI

final class ListViewModel: ObservableObject {
    @Inject var fetchListItemsUseCase: IFetchLocationItemsUseCase
    @Inject var favoriteLocationUseCase: IFavoriteLocationUseCase

    @Published private(set) var locationItems: [LocationItem] = []
    private var cancellables = Set<AnyCancellable>()
    init() {
        fetchListItems()
    }

    func fetchListItems() {
        fetchListItemsUseCase.execute()
            .receive(on: RunLoop.main)
            .assign(to: &$locationItems)
    }

    func favoriteBinding(_ locationItem: LocationItem) -> Binding<Bool> {
        Binding {
            self.favoriteLocationUseCase.isFavorite(locationItem.id)
        } set: { isFavorite in
            self.favoriteLocationUseCase.toggleFavorite(locationItem.id, isOn: locationItem.isFavorite)
        }
    }
}
