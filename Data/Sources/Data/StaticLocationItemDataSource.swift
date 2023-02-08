//
//  StaticLocationItemDataSource.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-08.
//

import Combine
import Foundation
import Model

public struct StaticLocationItemDataSource: ILocationItemDataSource {

    public init() { }

    public func getLocationItems() -> AnyPublisher<[Model.LocationItem], Never> {
        let subject = CurrentValueSubject<[LocationItem], Never>([])

        do {
            let locations: [LocationItem] = try locationsFromJsonFixture("CardList")
            subject.send(locations)
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

private func locationsFromJsonFixture(_ resourceName: String) throws -> [LocationItem] {
    guard let url = Bundle.module.url(forResource: resourceName, withExtension: "json") else {
        throw ResourceError.namedResourceNotInBundle(resourceName)
    }

    let data = try Data(contentsOf: url)

    let decoder = JSONDecoder()
    return try decoder.decode([LocationItem].self, from: data)
}
