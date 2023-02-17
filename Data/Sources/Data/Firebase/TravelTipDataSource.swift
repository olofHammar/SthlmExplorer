//
//  TravelTipDataSource.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-11.
//

import Combine
import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Model

/// A data source for retrieving `TravelTipItem` objects from Firestore.
public class TravelTipDataSource: ITravelTipDataSource {
    /// The `Firestore` instance used by this data source.
    private var firestore = Firestore.firestore()

    /// Initializes a new instance of the `TravelTipDataSource` class.
    public init() { }

    /// Retrieves a stream of `TravelTipItem` objects from Firestore.
    ///
    /// - Returns: A publisher that emits an array of `TravelTipItem` objects, or an empty array if no travel tips are found.
    public func getTravelTips() -> AnyPublisher<[TravelTipItem], Never> {
        let publisher = CurrentValueSubject<[TravelTipItem], Never>([])

        firestore
            .travelTipCollection()
            .addSnapshotListener { snapshot, error in
                if let error {
                    print("Error: \(error.localizedDescription)")
                }

                do {
                    if let locations = try snapshot?.documents.compactMap({ try $0.data(as: TravelTipItem.self) }) {
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

/// Returns a `CollectionReference` object for the 'traveltips' collection in Firestore.
private extension Firestore {
    func travelTipCollection() -> CollectionReference {
        self.collection("traveltips")
    }
}
