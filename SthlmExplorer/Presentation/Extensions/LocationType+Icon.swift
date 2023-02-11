//
//  LocationType+Icon.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-11.
//

import Model
import SwiftUI

extension Location.LocationType {
    var icon: Image {
        switch self {
        case .landmark:
            return Asset.Icon.destination.swiftUIImage
        case .museum:
            return Asset.Icon.parthenon.swiftUIImage
        case .scenicView:
            return Asset.Icon.mountain.swiftUIImage
        }
    }
}
