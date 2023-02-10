//
//  LocationItemsRepository.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-08.
//

import Combine
import Data
import Foundation
import Model
import OrderedCollections
import ShortcutFoundation
import SwiftUI

public struct LocationItemsRepository: ILocationItemsRepository {
    @Inject private(set) var locationsDataSource: ILocationsDataSource
    @Inject private(set) var favoritesDataSource: IFavoriteLocationsDataSource

    public init() { }

    public func getLocationItems() -> AnyPublisher<[LocationItem], Never> {
        return favoritesDataSource.favoriteLocationsPublisher
            .replaceError(with: OrderedSet<String>())
            .combineLatest(locationsDataSource.getLocations())
            .map { favorites, locations -> [LocationItem] in
                return locations.map { location in
                    LocationItem(location: location, isFavorite: favorites.contains(location.id))
                }
            }
            .eraseToAnyPublisher()
    }
}
