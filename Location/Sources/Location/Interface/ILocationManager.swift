//
//  ILocationManager.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-10.
//

import Combine
import Foundation
import MapKit

/// A protocol defining the interface for an object that manages location-related functionality.
public protocol ILocationManager {

    /// A publisher that emits a value when the user enters a monitored region.
    var didEnterRegionPublisher: PassthroughSubject<Void, Never> { get }

    /// A publisher that emits the current user region.
    var userRegionPublisher: PassthroughSubject<MKCoordinateRegion, Never> { get }

    /// A boolean indicating whether location services are enabled for the app.
    var isLocationEnabled: Bool { get }

    /// The current authorization status for the app's use of location services.
    var authorizationStatus: CLAuthorizationStatus { get }

    /// The user's current location.
    var userLocation: CLLocation? { get }

    /// The user's current coordinates.
    var userCoordinates: CLLocationCoordinate2D? { get }

    /// Requests permission to use the device's location.
    func requestLocationPermission()

    /// Starts monitoring the specified region.
    /// - Parameter region: The region to monitor.
    func startMonitoringRegion(for region: CLRegion)

    /// Stops monitoring all previously monitored regions.
    func stopMonitoringRegions()

    /// Calculates the distance between the user's current location and the specified endpoint.
    /// - Parameter endpoint: A tuple containing the latitude and longitude of the endpoint.
    /// - Returns: The distance in minutes between the user's current location and the endpoint.
    func calculateDistance(to endpoint: (lat: Double, lng: Double)) -> Int
}
