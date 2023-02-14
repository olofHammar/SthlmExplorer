//
//  TravelTipItem.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-11.
//

import Foundation

public struct TravelTipItem: Codable, Identifiable, Hashable {
    public let id: String
    public let title: String
    public let caption: String
    public let order: Int

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
