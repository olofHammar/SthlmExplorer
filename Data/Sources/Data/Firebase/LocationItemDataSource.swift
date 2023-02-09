//
//  LocationItemDataSource.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-08.
//

import Combine
import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Model

public struct LocationItemDataSource: ILocationItemDataSource {
    private var firestore = Firestore.firestore()

    public init() { }

    public func getLocationItems() -> AnyPublisher<[LocationItem], Never> {
        let publisher = CurrentValueSubject<[LocationItem], Never>([])

        firestore
            .locationCollection()
            .addSnapshotListener { snapshot, error in
                if let error {
                    print("Error: \(error.localizedDescription)")
                }

                do {
                    if let locations = try snapshot?.documents.compactMap({ try $0.data(as: LocationItem.self) }) {
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
    func locationCollection() -> CollectionReference {
        self.collection("locations")
    }
}
