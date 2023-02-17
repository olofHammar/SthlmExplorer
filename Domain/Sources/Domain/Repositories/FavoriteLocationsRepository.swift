//
//  FavoriteLocationsRepository.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-11.
//

import Data
import Foundation
import ShortcutFoundation

/// A repository for favorite locations that conforms to the `IFavoriteLocationsRepository` protocol.
public struct FavoriteLocationsRepository: IFavoriteLocationsRepository {

    /// The data source for the repository.
    @Inject private(set) var dataSource: IFavoriteLocationsDataSource

    /// Initializes a new instance of `FavoriteLocationsRepository`.
    public init() { }

    /// Adds a location to the user's list of favorite locations.
    /// - Parameter id: The ID of the location to add.
    public func addFavoriteLocation(with id: String) {
        dataSource.addFavoriteLocation(with: id)
    }

    /// Removes a location with the given ID from the list of favorite locations.
    /// - Parameter id: The ID of the location to remove.
    public func removeFavoriteLocation(with id: String) {
        dataSource.removeFavoriteLocation(with: id)
    }

    /// Checks if a location with the given ID is a favorite.
    /// - Parameter id: The ID of the location to check.
    /// - Returns: `true` if the location is a favorite, `false` otherwise.
    public func isFavoriteLocation(_ id: String) -> Bool {
        dataSource.isFavorite(id)
    }
}
