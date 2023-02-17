//
//  IFavoriteLocationUseCase.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-08.
//

import Foundation

/// A use case for managing a user's favorite locations.
public protocol IFavoriteLocationUseCase {

    /// Toggles the favorite status of the location with the specified ID.
    ///
    /// - Parameters:
    ///   - id: The ID of the location to toggle the favorite status of.
    ///   - isOn: A Boolean value indicating whether to turn the favorite status on (`true`) or off (`false`).
    func toggleFavorite(_ id: String, isOn: Bool)

    /// Returns a Boolean value indicating whether the location with the specified ID is a favorite of the user.
    ///
    /// - Parameter id: The ID of the location to check.
    /// - Returns: `true` if the location with the specified ID is a favorite of the user, otherwise `false`.
    func isFavorite(_ id: String) -> Bool
}
