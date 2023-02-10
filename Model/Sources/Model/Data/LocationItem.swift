//
//  LocationItem.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-08.
//

import Foundation
import CoreLocation

public struct LocationItem: Codable, Identifiable, Hashable {
    public let id: String
    public let title: String
    public let description: String
    public let type: String
    public let image: String
    public let latitude: Double
    public let longitude: Double

    public static func == (lhs: LocationItem, rhs: LocationItem) -> Bool {
        return lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
}
