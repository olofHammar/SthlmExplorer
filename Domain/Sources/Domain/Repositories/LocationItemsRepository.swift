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

/// A repository for location items that conforms to the `ILocationItemsRepository` protocol.
public struct LocationItemsRepository: ILocationItemsRepository {

    /// The data source for the locations.
    @Inject private(set) var locationsDataSource: ILocationsDataSource

    /// The data source for favorite locations.
    @Inject private(set) var favoritesDataSource: IFavoriteLocationsDataSource

    /// Initializes a new instance of `LocationItemsRepository`.
    public init() { }

    /// Gets a list of location items.
    /// - Returns: A publisher that emits an array of location items.
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
