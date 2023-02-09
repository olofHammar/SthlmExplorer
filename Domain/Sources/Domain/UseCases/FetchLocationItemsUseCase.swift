//
//  FetchLocationItemsUseCase.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-08.
//

import Combine
import Data
import Foundation
import Model
import ShortcutFoundation

public struct FetchLocationItemsUseCase: IFetchLocationItemsUseCase {
    @Inject private(set) var repository: ILocationItemsRepository

    public init() { }

    public func execute() -> AnyPublisher<[LocationItem], Never> {
        repository.getLocationItems()
    }
}
