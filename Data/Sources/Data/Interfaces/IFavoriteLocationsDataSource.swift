//
//  IFavoriteLocationsDataSource.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-08.
//

import Combine
import Foundation
import OrderedCollections

/// A protocol defining a data source for managing a set of favorite locations.
public protocol IFavoriteLocationsDataSource {
    /// A publisher that emits changes to the set of favorite location IDs.
    var favoriteLocationsPublisher: Published<OrderedSet<String>>.Publisher { get }

    /// Loads the initial set of favorite locations from persistent storage.
    func loadFavorites()

    /// Adds a new location with the given ID to the set of favorite locations.
    ///
    /// - Parameter id: The ID of the location to add.
    func addFavoriteLocation(with id: String)

    /// Removes the location with the given ID from the set of favorite locations.
    ///
    /// - Parameter id: The ID of the location to remove.
    func removeFavoriteLocation(with id: String)

    /// Checks whether the location with the given ID is currently a favorite.
    ///
    /// - Parameter id: The ID of the location to check.
    /// - Returns: `true` if the location is a favorite, `false` otherwise.
    func isFavorite(_ id: String) -> Bool
}
