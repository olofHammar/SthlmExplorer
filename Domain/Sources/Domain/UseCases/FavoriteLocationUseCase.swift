//
//  FavoriteLocationUseCase.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-08.
//

import Data
import ShortcutFoundation
import SwiftUI

public struct FavoriteLocationUseCase: IFavoriteLocationUseCase {
    @Inject private(set) var favoriteLocationsRepository: IFavoriteLocationsRepository

    public init() { }

    public func toggleFavorite(_ id: String, isOn: Bool) {
        if isOn {
            favoriteLocationsRepository.removeFavoriteLocation(with: id)
        } else {
            favoriteLocationsRepository.addFavoriteLocation(with: id)
        }
    }

    public func isFavorite(_ id: String) -> Bool {
        favoriteLocationsRepository.isFavoriteLocation(id)
    }
}
