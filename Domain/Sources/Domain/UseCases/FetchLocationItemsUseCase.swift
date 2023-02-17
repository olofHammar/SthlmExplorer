//
//  FetchLocationItemsUseCase.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-08.
//

import Combine
import Foundation
import Model
import ShortcutFoundation

/// A use case for fetching location items that conforms to the `IFetchLocationItemsUseCase` protocol.
public struct FetchLocationItemsUseCase: IFetchLocationItemsUseCase {

    /// The repository used to fetch the location items.
    @Inject private(set) var repository: ILocationItemsRepository

    /// Initializes a new instance of `FetchLocationItemsUseCase`.
    public init() { }

    /// Executes the use case and retrieves a list of location items.
    /// - Returns: A publisher that emits an array of `LocationItem` objects and never fails.
    public func execute() -> AnyPublisher<[LocationItem], Never> {
        repository.getLocationItems()
    }
}
