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
            let locations: [LocationItem] = try modelFromJsonFixture("CardList")
            subject.send(locations)
        } catch {
            print("Error getting data")
        }

        return subject
            .eraseToAnyPublisher()
    }
}

private enum ResourceError: Error {
    case namedResourceNotInBundle(String)
}

private func modelFromJsonFixture<T: Decodable>(_ resourceName: String) throws -> T {
    guard let url = Bundle.module.url(forResource: resourceName, withExtension: "json", subdirectory: "Fixtures") else {
        throw ResourceError.namedResourceNotInBundle(resourceName)
    }

    let data = try Data(contentsOf: url)

    let decoder = JSONDecoder()
    decoder.dataDecodingStrategy = .base64
    return try decoder.decode(T.self, from: data)
}
