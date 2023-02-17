//
//  TravelTipItem.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-11.
//

import Foundation

///  The `TravelTipItem` struct represents a single travel tip, including its title, caption, and order.
public struct TravelTipItem: Codable, Identifiable, Hashable {
    /// The unique identifier for the travel tip.
    public let id: String

    /// The title of the travel tip.
    public let title: String

    /// The caption of the travel tip.
    public let caption: String

    /// The order of the travel tip.
    public let order: Int

    /// Initializes a new `TravelTipItem`.
    /// - Parameters:
    ///   - id: The unique identifier for the travel tip.
    ///   - title: The title of the travel tip.
    ///   - caption: The caption of the travel tip.
    ///   - order: The order of the travel tip.
    public init(
        id: String,
        title: String,
        caption: String,
        order: Int
    ) {
        self.id = id
        self.title = title
        self.caption = caption
        self.order = order
    }
}
