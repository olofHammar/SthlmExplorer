//
//  LocationItem.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-08.
//

import Foundation
import CoreLocation

public struct LocationItem: Identifiable, Hashable {
    public var id: String { location.id }
    public let location: Location
    public var isFavorite: Bool

    public init(
        location: Location,
        isFavorite: Bool
    ) {
        self.location = location
        self.isFavorite = isFavorite
    }
}

public struct Location: Codable, Identifiable, Hashable {
    public let id: String
    public let title: String
    public let description: String
    public let type: String
    public let image: String
    public let latitude: Double
    public let longitude: Double

    public init(
        id: String,
        title: String,
        description: String,
        type: String,
        image: String,
        latitude: Double,
        longitude: Double
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.type = type
        self.image = image
        self.latitude = latitude
        self.longitude = longitude
    }

    public static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
}
