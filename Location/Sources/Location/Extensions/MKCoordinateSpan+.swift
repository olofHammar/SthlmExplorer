//
//  MKCoordinateSpan+.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-10.
//

import MapKit

extension MKCoordinateSpan {
    static let mediumCity = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    static let streetLevel = MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004)
    static let locationZoomed = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
}
