//
//  IFavoriteLocationsRepository.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-11.
//

import Foundation

public protocol IFavoriteLocationsRepository {
    func addFavoriteLocation(with id: String)
    func removeFavoriteLocation(with id: String)
    func isFavoriteLocation(_ id: String) -> Bool
}
