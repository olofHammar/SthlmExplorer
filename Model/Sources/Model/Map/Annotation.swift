//
//  Annotation.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-16.
//

import Foundation
import MapKit

/// The Annotation class extends MKPointAnnotation and represents a location annotation on a map.
public class Annotation: MKPointAnnotation, Identifiable {
    /// The LocationItem associated with the annotation.
    public var annotationItem: LocationItem

    /// Initializes a new `Annotation` with the given `LocationItem`.
    /// - Parameters:
    /// -  annotationItem: The `LocationItem` associated with the annotation.
    public init(annotationItem: LocationItem) {
        self.annotationItem = annotationItem
        super.init()
        self.coordinate = CLLocationCoordinate2D(latitude: annotationItem.location.latitude, longitude: annotationItem.location.longitude)
        self.title = "\(annotationItem.location.title) \n" + "\(annotationItem.location.type)".uppercased()
    }
}
