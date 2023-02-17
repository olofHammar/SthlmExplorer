//
//  LocationManager.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-10.
//

import Combine
import Foundation
import MapKit

public final class LocationManager: NSObject, ILocationManager, ObservableObject {
    public var clLocationManager = CLLocationManager()
    
    public var didEnterRegionPublisher = PassthroughSubject<Void, Never>()
    public var userRegionPublisher = PassthroughSubject<MKCoordinateRegion, Never>()

    public var isLocationEnabled: Bool { CLLocationManager.locationServicesEnabled() }
    public var authorizationStatus: CLAuthorizationStatus { clLocationManager.authorizationStatus }
    public var userLocation: CLLocation? { clLocationManager.location }
    public var userCoordinates: CLLocationCoordinate2D? { clLocationManager.location?.coordinate }

    public override init() {
        super.init()
        clLocationManager.delegate = self
        clLocationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        clLocationManager.distanceFilter = 2
        clLocationManager.startUpdatingLocation()
    }

    public func requestLocationPermission() {
        clLocationManager.requestWhenInUseAuthorization()
    }

    public func startMonitoringRegion(for region: CLRegion) {
        clLocationManager.startMonitoring(for: region)
    }

    public func stopMonitoringRegions() {
        for region in clLocationManager.monitoredRegions {
            clLocationManager.stopMonitoring(for: region)
        }
    }

    public func calculateDistance(to endpoint: (lat: Double, lng: Double)) -> Int {
        guard let location = clLocationManager.location?.coordinate else { return 0 }

        let startPoint = CLLocation(latitude: location.latitude, longitude: location.longitude)
        let distanceInMin = startPoint.distance(from: CLLocation(latitude: endpoint.lat, longitude: endpoint.lng)) / 110

        return Int(distanceInMin.rounded())
    }

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
