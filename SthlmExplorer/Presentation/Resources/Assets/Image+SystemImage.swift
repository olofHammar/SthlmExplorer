//
//  Image+SystemImage.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-14.
//

import SwiftUI

/// A selection of available system images.
public enum SystemImage: String {
    case xMark = "xmark"
    case magnifyingGlass = "magnifyingglass"
    case heart = "heart"
    case heartFill = "heart.fill"
    case tram = "tram"
    case walk = "figure.walk"
    case bike = "bicycle"
    case location = "location"

    var systemName: String {
        self.rawValue
    }
}

/// Image as a systemImage
public extension Image {
    /// Creates a Image as a systemImage.
    ///
    ///  - Parameters:
    ///    - systemImage: A selected case of SystemImage.
    init(systemImage: SystemImage) {
        self.init(systemName: systemImage.systemName)
    }
}
