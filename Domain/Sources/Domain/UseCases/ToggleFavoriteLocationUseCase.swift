//
//  LocationItem.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-08.
//

import OrderedCollections
import SwiftUI

public struct ToggleFavoriteLocationUseCase: IToggleFavoriteLocationUseCase {
    @AppStorage("favorites")
    private var favoriteStorage = Data()

    public init() { }

    public func toggleFavorite(_ id: String, isOn: Bool) {
        if !isOn {
            var favorites = favoriteStorage.toFavorites()
            favorites.append(id)
            favoriteStorage = Data.fromFavorites(favorites)
        } else {
            var favorites = favoriteStorage.toFavorites()
            if let index = favorites.firstIndex(of: id) {
                favorites.remove(at: index)
            }
            favoriteStorage = Data.fromFavorites(favorites)
        }
    }
}

private extension Data {
    func toFavorites() -> OrderedSet<String> {
        guard let favorites = try? JSONDecoder().decode(OrderedSet<String>.self, from: self) else {
            return OrderedSet<String>()
        }
        return favorites
    }

    static func fromFavorites(_ favorites: OrderedSet<String>) -> Data {
        do {
            return try JSONEncoder().encode(favorites)
        } catch {
            print("Error encoding favorites: \(error)")
            return Data()
        }
    }
}
