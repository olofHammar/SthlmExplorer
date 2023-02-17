//
//  IFetchLocationsItemsUseCase.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-08.
//

import Combine
import Foundation
import Model

/// A use case for fetching location items.
public protocol IFetchLocationItemsUseCase {

    /// Fetches the location items and returns them as a publisher.
    ///
    /// - Returns: A publisher that emits an array of `LocationItem` objects, and never fails.
    func execute() -> AnyPublisher<[LocationItem], Never>
}
