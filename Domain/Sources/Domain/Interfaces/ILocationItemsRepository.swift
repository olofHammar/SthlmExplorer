//
//  ILocationItemsRepository.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-08.
//

import Combine
import Foundation
import Model

public protocol ILocationItemsRepository {
    func getLocationItems() -> AnyPublisher<[LocationItem], Never>
}
