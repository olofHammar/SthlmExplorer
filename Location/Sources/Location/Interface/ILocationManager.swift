//
//  ILocationManager.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-10.
//

import Combine
import Foundation
import MapKit

public protocol ILocationManager {
    var didEnterRegionPublisher: PassthroughSubject<Void, Never> { get }
    var userRegionPublisher: PassthroughSubject<MKCoordinateRegion, Never> { get }
    var isLocationEnabled: Bool { get }
    var authorizationStatus: CLAuthorizationStatus { get }
    var userLocation: CLLocation? { get }
    var userCoordinates: CLLocationCoordinate2D? { get }


    func requestLocationPermission()
    func startMonitoringRegion(for region: CLRegion)
    func stopMonitoringRegions()
    func calculateDistance(to endpoint: (lat: Double, lng: Double)) -> Int
}
