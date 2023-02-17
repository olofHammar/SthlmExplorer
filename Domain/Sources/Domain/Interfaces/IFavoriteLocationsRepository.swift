//
//  IFavoriteLocationsRepository.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-11.
//

import Foundation

/// A repository for managing a user's favorite locations.
public protocol IFavoriteLocationsRepository {

    /// Adds the location with the specified ID to the user's list of favorite locations.
    ///
    /// - Parameter id: The ID of the location to add to the favorites list.
    func addFavoriteLocation(with id: String)

    /// Removes the location with the specified ID from the user's list of favorite locations.
    ///
    /// - Parameter id: The ID of the location to remove from the favorites list.
    func removeFavoriteLocation(with id: String)

    /// Returns a Boolean value indicating whether the location with the specified ID is in the user's list of favorite locations.
    ///
    /// - Parameter id: The ID of the location to check.
    /// - Returns: `true` if the location with the specified ID is in the user's list of favorite locations, otherwise `false`.
    func isFavoriteLocation(_ id: String) -> Bool
}
