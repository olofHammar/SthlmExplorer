//
//  Annotation.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-16.
//

import Foundation
import MapKit

public class Annotation: MKPointAnnotation {
    public let annotationItem: LocationItem

    public init(annotationItem: LocationItem) {
        self.annotationItem = annotationItem
        super.init()
        self.coordinate = CLLocationCoordinate2D(latitude: annotationItem.location.latitude, longitude: annotationItem.location.longitude)
        self.title = "\(annotationItem.location.title) \n" + "\(annotationItem.location.type)".uppercased()
    }
}
