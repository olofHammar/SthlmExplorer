//
//  FavoriteLocationsRepository.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-11.
//

import Data
import Foundation
import ShortcutFoundation

public struct FavoriteLocationsRepository: IFavoriteLocationsRepository {
    @Inject private(set) var dataSource: IFavoriteLocationsDataSource

    public init() { }
    
    public func addFavoriteLocation(with id: String) {
        dataSource.addFavoriteLocation(with: id)
    }

    public func removeFavoriteLocation(with id: String) {
        dataSource.removeFavoriteLocation(with: id)
    }

    public func isFavoriteLocation(_ id: String) -> Bool {
        dataSource.isFavorite(id)
    }
}
