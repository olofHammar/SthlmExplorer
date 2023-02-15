//
//  FavoriteLocationsDataSource.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-10.
//

import Combine
import OrderedCollections
import SwiftUI

/// A data source that manages a collection of favorite locations.
public class FavoriteLocationsDataSource: IFavoriteLocationsDataSource {

    /// The storage for the collection of favorite locations.
    @AppStorage("favorites")
    private var favoriteStorage = Data()

    /// The collection of favorite locations, wrapped in a `Published` property wrapper to make it observable.
    @Published private(set) var favoriteLocations = OrderedSet<String>()

    /// A publisher for the collection of favorite locations.
    public var favoriteLocationsPublisher: Published<OrderedCollections.OrderedSet<String>>.Publisher { $favoriteLocations }

    /// The set of cancellables to cancel when the object is deallocated.
    private var cancellables = Set<AnyCancellable>()

    /// Initializes a new instance of `FavoriteLocationsDataSource`, loads the stored favorites, and starts observing changes to the favorites.
    public init() {
        loadFavorites()
        startObserver()
    }

    /// Cancels all the cancellables when the object is deallocated.
    deinit {
        cancellables.forEach { $0.cancel() }
    }

    /// Loads the collection of favorite locations from storage.
    public func loadFavorites() {
        do {
            self.favoriteLocations =  try JSONDecoder().decode(OrderedSet<String>.self, from: favoriteStorage)
        } catch {
            print("None or invalid favorites")
        }
    }

    /// Adds a location with the given ID to the collection of favorite locations.
    public func addFavoriteLocation(with id: String) {
        favoriteLocations.append(id)
    }

    /// Removes the location with the given ID from the collection of favorite locations.
    public func removeFavoriteLocation(with id: String) {
        favoriteLocations.remove(id)
    }

    /// - Returns: A Boolean value indicating whether the location with the given ID is in the collection of favorite locations.
    public func isFavorite(_ id: String) -> Bool {
        favoriteLocations.contains(id)
    }

    /// Starts observing changes to the collection of favorite locations, and stores the updated collection whenever it changes.
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
