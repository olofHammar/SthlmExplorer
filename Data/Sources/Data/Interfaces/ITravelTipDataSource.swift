//
//  ITravelTipDataSource.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-08.
//

import Combine
import Foundation
import Model

/// A protocol defining a data source for retrieving a list of travel tips.
public protocol ITravelTipDataSource {

    /// Retrieves a list of travel tips from the data source.
    ///
    /// - Returns: A publisher that emits an array of `TravelTipItem` objects.
    func getTravelTips() -> AnyPublisher<[TravelTipItem], Never>
}
