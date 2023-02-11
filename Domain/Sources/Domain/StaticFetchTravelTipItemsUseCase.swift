//
//  StaticFetchTravelTipItemsUseCase.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-11.
//

import Combine
import Data
import Foundation
import Model

public struct StaticFetchTravelTipItemsUseCase: IFetchTravelTipItemsUseCase {

    public init() { }

    public func execute() -> AnyPublisher<[TravelTipItem], Never> {
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
