//
//  LocationItem.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-08.
//

import Foundation
import CoreLocation

/// A struct that represents a location item that has an identifier, a location, and an isFavorite flag.
public struct LocationItem: Identifiable, Hashable {
    /// The identifier of the location item, derived from its location ID.
    public var id: String { location.id }

    /// The location of the item.
    public let location: Location

    /// A flag indicating whether the location item is marked as a favorite or not.
    public var isFavorite: Bool

    /// Creates a new location item.
    ///
    /// - Parameters:
    ///   - location: The location of the item.
    ///   - isFavorite: A flag indicating whether the location item is marked as a favorite or not.
    public init(
        location: Location,
        isFavorite: Bool
    ) {
        self.location = location
        self.isFavorite = isFavorite
    }
}

/// A struct that represents a location that has an identifier, a title, a description, a type, an image URL, a subway line, a set of tags, additional information, and coordinates.
public struct Location: Codable, Identifiable, Hashable {
    /// The identifier of the location.
    public let id: String

    /// The title of the location.
    public let title: String

    /// The description of the location.
    public let description: String

    /// The type of the location.
    public let type: LocationType

    /// The URL of the image of the location.
    public let image: String

    /// The subway line closest to the location.
    public let subway: String

    /// The set of tags associated with the location.
    public let tags: [String]

    /// Additional information about the location.
    public let info: [String]?

    /// The latitude of the location.
    public let latitude: Double

    /// The longitude of the location.
    public let longitude: Double

    /// Creates a new location.
    ///
    /// - Parameters:
    ///   - id: The identifier of the location.
    ///   - title: The title of the location.
    ///   - description: The description of the location.
    ///   - type: The type of the location.
    ///   - image: The URL of the image of the location.
    ///   - subway: The subway line that serves the location.
    ///   - tags: The set of tags associated with the location.
    ///   - info: Additional information about the location.
    ///   - latitude: The latitude of the location.
    ///   - longitude: The longitude of the location.
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

    /// The type of a location, represented as a string.
    public enum LocationType: String, Codable {
        case scenicView
        case museum
        case landmark
    }

    /// Checks if two locations are equal by comparing their identifiers.
    public static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.id == rhs.id
    }

    /// Returns a hash value for the location.
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

    static var emptyLocation: Location {
        .init(id: "",
              title: "",
              description: "",
              type: .landmark,
              image: "",
              subway: "",
              tags: [],
              info: nil,
              latitude: 0.0,
              longitude: 0.0
        )
    }
}
