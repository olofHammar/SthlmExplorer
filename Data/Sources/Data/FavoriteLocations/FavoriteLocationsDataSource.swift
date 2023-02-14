//
//  FavoriteLocationsDataSource.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-10.
//

import Combine
import OrderedCollections
import SwiftUI

public class FavoriteLocationsDataSource: IFavoriteLocationsDataSource {

    @AppStorage("favorites")
    private var favoriteStorage = Data()

    @Published private(set) var favoriteLocations = OrderedSet<String>()

    public var favoriteLocationsPublisher: Published<OrderedCollections.OrderedSet<String>>.Publisher { $favoriteLocations }

    private var cancellables = Set<AnyCancellable>()

    public init() {
        loadFavorites()
        startObserver()
    }

    deinit {
        cancellables.forEach { $0.cancel() }
    }

    public func loadFavorites() {
        do {
            self.favoriteLocations =  try JSONDecoder().decode(OrderedSet<String>.self, from: favoriteStorage)
        } catch {
            print("None or invalid favorites")
        }
    }

    public func addFavoriteLocation(with id: String) {
        favoriteLocations.append(id)
    }

    public func removeFavoriteLocation(with id: String) {
        favoriteLocations.remove(id)
    }

    public func isFavorite(_ id: String) -> Bool {
        favoriteLocations.contains(id)
    }

    private func startObserver() {
        $favoriteLocations
            .compactMap {
                try? JSONEncoder().encode($0)
            }
            .receive(on: RunLoop.main)
            .assign(to: \.favoriteStorage, on: self)
            .store(in: &cancellables)
    }
}
