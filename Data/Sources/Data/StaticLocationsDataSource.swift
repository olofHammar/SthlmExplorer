//
//  StaticLocationsDataSource.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-08.
//

import Combine
import Foundation
import Model

/// A struct representing a static data source for retrieving a pre-defined list of locations.
public struct StaticLocationsDataSource: ILocationsDataSource {

    /// Creates a new instance of the `StaticLocationsDataSource`.
    public init() { }

    /// Retrieves a pre-defined list of locations from the data source.
    ///
    /// - Returns: A publisher that emits an array of `Location` objects.
    public func getLocations() -> AnyPublisher<[Location], Never> {
        let subject = CurrentValueSubject<[Location], Never>([])

        do {
            let locations: [Location] = try locationsFromJsonFixture("CardList")
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

private func locationsFromJsonFixture(_ resourceName: String) throws -> [Location] {
    guard let url = Bundle.module.url(forResource: resourceName, withExtension: "json") else {
        throw ResourceError.namedResourceNotInBundle(resourceName)
    }

    let data = try Data(contentsOf: url)

    let decoder = JSONDecoder()
    return try decoder.decode([Location].self, from: data)
}
