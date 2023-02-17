//
//  FavoriteLocationUseCase.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-08.
//

import Data
import ShortcutFoundation
import SwiftUI

/// An implementation of `IFavoriteLocationUseCase` that interacts with a `IFavoriteLocationsRepository` to manage favorite locations.
public struct FavoriteLocationUseCase: IFavoriteLocationUseCase {

    /// The repository that the use case interacts with.
    @Inject private(set) var favoriteLocationsRepository: IFavoriteLocationsRepository

    /// Initializes a new instance of `FavoriteLocationUseCase`.
    public init() { }

    /// Toggles whether a location with the given ID is a favorite or not.
    /// - Parameters:
    ///   - id: The ID of the location to toggle.
    ///   - isOn: Whether the location should be set as favorite (`true`) or not favorite (`false`).
    public func toggleFavorite(_ id: String, isOn: Bool) {
        if isOn {
            favoriteLocationsRepository.removeFavoriteLocation(with: id)
        } else {
            favoriteLocationsRepository.addFavoriteLocation(with: id)
        }
    }

    /// Checks whether a location with the given ID is a favorite or not.
    /// - Parameter id: The ID of the location to check.
    /// - Returns: `true` if the location is a favorite, `false` otherwise.
    public func isFavorite(_ id: String) -> Bool {
        favoriteLocationsRepository.isFavoriteLocation(id)
    }
}
