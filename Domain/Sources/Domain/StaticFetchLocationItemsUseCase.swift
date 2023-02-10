//
//  StaticFetchLocationItemsUseCase.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-08.
//

import Combine
import Data
import Foundation
import Model

public struct StaticFetchLocationItemsUseCase: IFetchLocationItemsUseCase {

    public init() { }
    
    public func execute() -> AnyPublisher<[LocationItem], Never> {
        let subject = CurrentValueSubject<[LocationItem], Never>([])

        do {
            let locations: [Location] = try locationsFromJsonFixture("CardList")
            subject.send(locations.compactMap { LocationItem(location: $0, isFavorite: false) })
        } catch ResourceError.namedResourceNotInBundle(let resourceName) {
            print("Error: The resource \(resourceName) could not be found in the bundle.")
        } catch {
            print("Error: \(error.localizedDescription)")
        }

        return subject
            .eraseToAnyPublisher()
    }
}

private enum ResourceError: Error {
    case namedResourceNotInBundle(String)
}

private func locationsFromJsonFixture(_ resourceName: String) throws -> [Location] {
    guard let url = Bundle.module.url(forResource: resourceName, withExtension: "json") else {
        throw ResourceError.namedResourceNotInBundle(resourceName)
    }

    let data = try Data(contentsOf: url)

    let decoder = JSONDecoder()
    return try decoder.decode([Location].self, from: data)
}
