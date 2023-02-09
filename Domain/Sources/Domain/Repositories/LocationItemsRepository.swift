//
//  LocationItemsRepository.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-08.
//

import Combine
import Data
import Foundation
import Model
import ShortcutFoundation

public struct LocationItemsRepository: ILocationItemsRepository {
    @Inject private(set) var dataSource: ILocationItemDataSource

    public init() { }

    public func getLocationItems() -> AnyPublisher<[LocationItem], Never> {
        dataSource.getLocationItems()
    }
}
