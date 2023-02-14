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
    public let type: LocationType
    public let image: String
    public let subway: String
    public let tags: [String]
    public let info: [String]?
    public let latitude: Double
    public let longitude: Double

    public init(
        id: String,
        title: String,
        description: String,
        type: LocationType,
        image: String,
        subway: String,
        tags: [String],
        info: [String]?,
        latitude: Double,
        longitude: Double
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.type = type
        self.image = image
        self.subway = subway
        self.tags = tags
        self.info = info
        self.latitude = latitude
        self.longitude = longitude
    }

    public enum LocationType: String, Codable {
        case scenicView
        case museum
        case landmark
    }

    public static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
}

public extension Location {
    static var mockLocation: Location {
        .init(
            id: "abcd",
            title: "Royal Palace",
            description: "Welcome to one of the largest palaces in Europe! The Royal Palace is the official residence of His Majesty the King of Sweden, with over 600 rooms.<br>The Palace is open to the public and offers no less than five museums. The Palace was largely built during the eighteenth century in the Italian Baroque style, on the spot where the “Tre Kronor” castle burned down in 1697. Visit the reception rooms with splendid interiors from the eighteenth and nineteenth centuries, Rikssalen (the Hall of State) with Queen Kristina’s silver throne, and Ordenssalarna (Halls of the Orders of Chivalry). You can also see Gustav III’s Museum of Antiquities, the Tre Kronor Museum, and the Treasury.<br>The Royal Palace also contains the Armory, with royal costumes and armor, as well as coronation carriages and magnificent coaches from the Royal Stable. Make sure not to miss the parade of soldiers and the daily changing of the guard.",
            type: .landmark,
            image: "https://a.cdn-hotels.com/gdcs/production150/d379/233f5a72-9aec-4921-b5e8-925afcbca8c4.jpg",
            subway: "Mariatorget",
            tags: ["tag1", "tag2"],
            info: ["Moday - Sunday: 10 - 23"],
            latitude: 59.32694,
            longitude: 18.07176
        )
    }
}
