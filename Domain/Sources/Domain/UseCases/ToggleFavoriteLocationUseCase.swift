//
//  LocationItem.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-08.
//

import Data
import ShortcutFoundation
import SwiftUI

public struct ToggleFavoriteLocationUseCase: IToggleFavoriteLocationUseCase {
    @Inject var favoriteLocationsDataSource: IFavoriteLocationsDataSource

    public init() { }

    public func toggleFavorite(_ id: String, isOn: Bool) {
        if isOn {
            favoriteLocationsDataSource.removeFavoriteLocation(with: id)
        } else {
            favoriteLocationsDataSource.addFavoriteLocation(with: id)
        }
    }
}
