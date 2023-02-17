//
//  IFetchTravelTipItemsUseCase.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-11.
//

import Combine
import Foundation
import Model

/// A use case for fetching travel tip items.
public protocol IFetchTravelTipItemsUseCase {

    /// Fetches the travel tip items and returns them as a publisher.
    ///
    /// - Returns: A publisher that emits an array of `TravelTipItem` objects, and never fails.
    func execute() -> AnyPublisher<[TravelTipItem], Never>
}
