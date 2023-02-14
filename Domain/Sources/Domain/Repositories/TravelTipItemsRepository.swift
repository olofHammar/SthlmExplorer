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

public struct TravelTipItemsRepository: ITravelTipItemsRepository {
    @Inject private(set) var travelTipItemsDataSource: ITravelTipDataSource

    public init() { }

    public func getTravelTips() -> AnyPublisher<[TravelTipItem], Never> {
        return travelTipItemsDataSource.getTravelTips()
            .eraseToAnyPublisher()
    }
}

