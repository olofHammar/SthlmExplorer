//
//  ILocationsDataSource.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-08.
//

import Combine
import Foundation
import Model

/// A protocol defining a data source for retrieving a list of locations.
public protocol ILocationsDataSource {

    /// Retrieves a list of locations from the data source.
    ///
    /// - Returns: A publisher that emits an array of `Location` objects.
    func getLocations() -> AnyPublisher<[Location], Never>
}
