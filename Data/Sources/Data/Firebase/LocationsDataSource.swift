//
//  LocationsDataSource.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-08.
//

import Combine
import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Model

/// A data source for locations that retrieves data from Firestore.
public class LocationsDataSource: ILocationsDataSource {
    /// The Firestore instance used to retrieve data.
    private var firestore = Firestore.firestore()

    /// Creates a new instance of LocationsDataSource.
    public init() { }

    /// Retrieves a stream of `Location` objects from Firestore.
    ///
    /// - Returns: A publisher that emits an array of `Location` objects, or an empty array if no locations are found.
    public func getLocations() -> AnyPublisher<[Location], Never> {
        let publisher = CurrentValueSubject<[Location], Never>([])

        firestore
            .locationCollection()
            .addSnapshotListener { snapshot, error in
                if let error {
                    print("Error: \(error.localizedDescription)")
                }

                do {
                    if let locations = try snapshot?.documents.compactMap({ try $0.data(as: Location.self) }) {
                        publisher.send(locations)
                    }
                } catch {
                    print("Error: \(error.localizedDescription)")
                }
            }

        return publisher
            .eraseToAnyPublisher()
    }
}

private extension Firestore {
    /// Returns a `CollectionReference` object for the 'locations' collection in Firestore.
    func locationCollection() -> CollectionReference {
        self.collection("locations")
    }
}
