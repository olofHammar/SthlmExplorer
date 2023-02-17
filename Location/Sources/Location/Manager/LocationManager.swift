//
//  LocationManager.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-10.
//

import Combine
import Foundation
import MapKit

/// The LocationManager class provides location-related functionality such as monitoring user's location, calculating distance, and handling region monitoring.
/// This class conforms to the ILocationManager protocol, which defines the interface for an object that manages location-related functionality.
public final class LocationManager: NSObject, ILocationManager, ObservableObject {

    /// The location manager responsible for providing location updates.
    public var clLocationManager = CLLocationManager()

    /// A publisher that emits a value when the user enters a monitored region.
    public var didEnterRegionPublisher = PassthroughSubject<Void, Never>()

    /// A publisher that emits the current user region.
    public var userRegionPublisher = PassthroughSubject<MKCoordinateRegion, Never>()

    /// A boolean indicating whether location services are enabled for the app.
    public var isLocationEnabled: Bool { CLLocationManager.locationServicesEnabled() }

    /// The current authorization status for the app's use of location services.
    public var authorizationStatus: CLAuthorizationStatus { clLocationManager.authorizationStatus }

    /// The user's current location.
    public var userLocation: CLLocation? { clLocationManager.location }

    /// The user's current coordinates.
    public var userCoordinates: CLLocationCoordinate2D? { clLocationManager.location?.coordinate }

    /// Initializes the location manager.
    public override init() {
        super.init()
        clLocationManager.delegate = self
        clLocationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        clLocationManager.distanceFilter = 2
        clLocationManager.startUpdatingLocation()
    }

    /// Requests permission to use the device's location.
    public func requestLocationPermission() {
        clLocationManager.requestWhenInUseAuthorization()
    }

    /// Starts monitoring the specified region.
    /// - Parameter region: The region to monitor.
    public func startMonitoringRegion(for region: CLRegion) {
        clLocationManager.startMonitoring(for: region)
    }

    /// Stops monitoring all previously monitored regions.
    public func stopMonitoringRegions() {
        for region in clLocationManager.monitoredRegions {
            clLocationManager.stopMonitoring(for: region)
        }
    }

    /// Calculates the distance between the user's current location and the specified endpoint.
    /// - Parameter endpoint: A tuple containing the latitude and longitude of the endpoint.
    /// - Returns: The distance in minutes between the user's current location and the endpoint.
    public func calculateDistance(to endpoint: (lat: Double, lng: Double)) -> Int {
        guard let location = clLocationManager.location?.coordinate else { return 0 }

        let startPoint = CLLocation(latitude: location.latitude, longitude: location.longitude)
        let distanceInMin = startPoint.distance(from: CLLocation(latitude: endpoint.lat, longitude: endpoint.lng)) / 110

        return Int(distanceInMin.rounded())
    }

    /// Returns the default region (Stockholm) to use when no user location is available.
    public static func stockholmRegion() -> MKCoordinateRegion {
        MKCoordinateRegion(center: .init(latitude: 59.3293, longitude: 18.0686), span: .mediumCity)
    }
}

extension LocationManager: CLLocationManagerDelegate {

    public func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        guard authorizationStatus == .authorizedWhenInUse || authorizationStatus == .authorizedAlways else { return }
        if let location = clLocationManager.location?.coordinate {
            userRegionPublisher.send(MKCoordinateRegion(center: location, span: .mediumCity))
        }
    }

    public func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        didEnterRegionPublisher.send()
    }

    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = clLocationManager.location?.coordinate {
            let region = MKCoordinateRegion(center: location, span: .mediumCity)
            userRegionPublisher.send(region)
        }
    }
}

public extension LocationManager {
    static func defaultRegion() -> MKCoordinateRegion {
        MKCoordinateRegion(center: .init(latitude: 59.3293, longitude: 18.0686), span: .mediumCity)
    }
}
