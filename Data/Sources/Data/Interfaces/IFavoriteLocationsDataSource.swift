//
//  IFavoriteLocationsDataSource.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-08.
//

import Combine
import Foundation
import OrderedCollections

public protocol IFavoriteLocationsDataSource {
    var favoriteLocationsPublisher: Published<OrderedSet<String>>.Publisher { get }

    func loadFavorites()
    func addFavoriteLocation(with id: String)
    func removeFavoriteLocation(with id: String)
    func isFavorite(_ id: String) -> Bool
}
