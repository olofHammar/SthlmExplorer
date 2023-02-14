//
//  IFetchTravelTipItemsUseCase.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-11.
//

import Combine
import Foundation
import Model

public protocol IFetchTravelTipItemsUseCase {
    func execute() -> AnyPublisher<[TravelTipItem], Never>
}
