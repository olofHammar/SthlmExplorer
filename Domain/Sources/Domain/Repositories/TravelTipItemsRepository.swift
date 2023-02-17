//
//  TravelTipItemsRepository.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-11.
//

import Combine
import Data
import Foundation
import Model
import ShortcutFoundation
import SwiftUI

/// A repository for travel tip items that conforms to the `ITravelTipItemsRepository` protocol.
public struct TravelTipItemsRepository: ITravelTipItemsRepository {

    /// The data source for the repository.
    @Inject private(set) var travelTipItemsDataSource: ITravelTipDataSource

    /// Initializes a new instance of `TravelTipItemsRepository`.
    public init() { }

    /// Retrieves all travel tip items from the repository.
    /// - Returns: A publisher that emits an array of `TravelTipItem`s, or an empty array if no items are found.
    public func getTravelTips() -> AnyPublisher<[TravelTipItem], Never> {
        return travelTipItemsDataSource.getTravelTips()
            .eraseToAnyPublisher()
    }
}

