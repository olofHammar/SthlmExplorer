//
//  FetchTravelTipItemsUseCase.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-08.
//

import Combine
import Foundation
import Model
import ShortcutFoundation

/// A use case for fetching travel tip items that conforms to the `IFetchTravelTipItemsUseCase` protocol.
public struct FetchTravelTipItemsUseCase: IFetchTravelTipItemsUseCase {

    /// The repository for fetching travel tip items.
    @Inject private(set) var repository: ITravelTipItemsRepository

    /// Initializes a new instance of `FetchTravelTipItemsUseCase`.
    public init() { }

    /// Executes the use case to fetch travel tip items.
    /// - Returns: A publisher that emits an array of `TravelTipItem` values.
    public func execute() -> AnyPublisher<[TravelTipItem], Never> {
        repository.getTravelTips()
    }
}
