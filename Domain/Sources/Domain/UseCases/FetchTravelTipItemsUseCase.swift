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

public struct FetchTravelTipItemsUseCase: IFetchTravelTipItemsUseCase {
    @Inject private(set) var repository: ITravelTipItemsRepository

    public init() { }

    public func execute() -> AnyPublisher<[TravelTipItem], Never> {
        repository.getTravelTips()
    }
}
