//
//  FavoriteLocationsDataSource.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-10.
//

import Combine
import OrderedCollections
import SwiftUI

public struct FavoriteLocationsDataSource: IFavoriteLocationsDataSource {

    @AppStorage("favorites")
    private var favoriteStorage = Data()

    public init() { }

    public func getFavorites() -> AnyPublisher<OrderedSet<String>, Never> {
        let publisher = CurrentValueSubject<OrderedSet<String>, Never>([])

        do {
            let favoriteIDs = try JSONDecoder().decode(OrderedSet<String>.self, from: favoriteStorage)
            publisher.send(favoriteIDs)
        } catch {
            print("None or invalid favorties")
        }

        return publisher
            .eraseToAnyPublisher()
    }
}
