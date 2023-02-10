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
    func getFavorites() -> AnyPublisher<OrderedSet<String>, Never>
}
