//
//  MKCoordinateSpan+.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-10.
//

import MapKit

/// Extensions to `MKCoordinateSpan` to provide commonly used values for map zooming.
extension MKCoordinateSpan {

    /// A coordinate span that is suitable for displaying a medium-sized city.
    static let mediumCity = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)

    /// A coordinate span that is suitable for displaying street-level detail.
    static let streetLevel = MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004)

    /// A coordinate span that is suitable for displaying a location at a highly zoomed-in level.
    static let locationZoomed = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
}
