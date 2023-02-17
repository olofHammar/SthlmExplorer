//
//  ITravelTipItemsRepository.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-11.
//

import Combine
import Foundation
import Model

/// A repository for travel tip items.
public protocol ITravelTipItemsRepository {

    /// Retrieves the travel tip items and returns them as a publisher.
    ///
    /// - Returns: A publisher that emits an array of `TravelTipItem` objects, and never fails.
    func getTravelTips() -> AnyPublisher<[TravelTipItem], Never>
}
