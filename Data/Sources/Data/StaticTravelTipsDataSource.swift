//
//  StaticTravelTipsDataSource.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-11.
//

import Combine
import Foundation
import Model

/// A struct representing a static data source for retrieving a pre-defined list of travel tips.
public struct StaticTravelTipsDataSource: ITravelTipDataSource {

    /// Creates a new instance of the `StaticTravelTipsDataSource`.
    public init() { }

    /// Retrieves a pre-defined list of travel tips from the data source.
    ///
    /// - Returns: A publisher that emits an array of `TravelTipItem` objects.
    public func getTravelTips() -> AnyPublisher<[TravelTipItem], Never> {
        let subject = CurrentValueSubject<[TravelTipItem], Never>([])

        do {
            let travelTips: [TravelTipItem] = try locationsFromJsonFixture("TravelTips")
            subject.send(travelTips)
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

private func locationsFromJsonFixture(_ resourceName: String) throws -> [TravelTipItem] {
    guard let url = Bundle.module.url(forResource: resourceName, withExtension: "json") else {
        throw ResourceError.namedResourceNotInBundle(resourceName)
    }

    let data = try Data(contentsOf: url)

    let decoder = JSONDecoder()
    return try decoder.decode([TravelTipItem].self, from: data)
}
