//
//  ILocationItemsRepository.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-08.
//

import Combine
import Foundation
import Model

/// A repository for location items.
public protocol ILocationItemsRepository {

    /// Retrieves the location items and returns them as a publisher.
    ///
    /// - Returns: A publisher that emits an array of `LocationItem` objects, and never fails.
    func getLocationItems() -> AnyPublisher<[LocationItem], Never>
}
