//
//  MapViewModel.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-10.
//

import Domain
import MapKit
import Model
import Navigation
import ShortcutFoundation
import SwiftUI

final class MapViewModel: ObservableObject {
    @Inject private var fetchLocationItemsUseCase: IFetchLocationItemsUseCase
    @Inject private var viewStateManager: IViewStateManager

    @Published private(set) var locationAnnotations: [Annotation] = []
    @Published var selectedAnnotation: Annotation?

    @Published private(set) var isCenteringUserLocation = false
    @Published private(set) var isPresentingDirections = false
    @Published private(set) var isPresentingDetail = false

    init() {
        startMapObserevers()
    }

    func centerUserLocation() {
        isCenteringUserLocation = true
    }

    func updateMapView(_ view: MKMapView) {
        DispatchQueue.main.async {
            self.isCenteringUserLocation = false
        }

        let currentMapAnnotations = view.annotations.compactMap { $0 as? Annotation }

        if currentMapAnnotations.count != locationAnnotations.count {
            view.removeAnnotations(view.annotations)
            view.addAnnotations(locationAnnotations)
        }

        if let selected = view.selectedAnnotations.first as? Annotation, selected != selectedAnnotation {
            if let annotation = selectedAnnotation {
                view.selectAnnotation(annotation, animated: true)
            } else {
                view.deselectAnnotation(selected, animated: true)
            }
        }
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? Annotation {
            let view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "default")
            let type: AnnotationAsset

            switch annotation.annotationItem.location.type {
            case .landmark:
                type = .landmark
            case .scenicView:
                type = .scenicView
            case .museum:
                type = .museum
            }

            view.glyphImage = type.image.image.withPadding(x: .x05, y: .x05)
            view.glyphTintColor = UIColor(asset: Asset.Colors.Main.accent)
            view.markerTintColor = UIColor(asset: Asset.Colors.Background.b100)
            view.zPriority = .max
            view.canShowCallout = true
            view.clusteringIdentifier = "cluster"

            return view
        } else if let annotation = annotation as? MKClusterAnnotation {
            let view = MKMarkerAnnotationView()
            view.glyphText = annotation.memberAnnotations.count.description
            view.markerTintColor = UIColor(asset: Asset.Colors.Main.accent)

            return view
        } else {
            return nil
        }
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotation = view.annotation as? Annotation else {
            return
        }

        DispatchQueue.main.async {
            withAnimation {
                self.selectedAnnotation = annotation
                self.viewStateManager.presentSelectedSheet()
            }
        }
    }

    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        if mapView.annotations.contains(where: { $0 as? Annotation == view.annotation as? Annotation }) {
            deselectAnnotation()
        }
    }

    func mapView(_ mapView: MKMapView, clusterAnnotationForMemberAnnotations memberAnnotations: [MKAnnotation]) -> MKClusterAnnotation {
        if selectedAnnotation != nil {
            mapView.deselectAnnotation(selectedAnnotation, animated: true)
        }

        return MKClusterAnnotation(memberAnnotations: memberAnnotations)
    }

    func deselectAnnotation() {
        DispatchQueue.main.async {
            self.selectedAnnotation = nil
        }

        DispatchQueue.main.async {
            withAnimation(.easeIn) {
                self.viewStateManager.dismissSelectedSheet()
            }
        }
    }

    func presentSelectedDetail() {
        withAnimation {
            isPresentingDetail = true
        }
    }

    func dismissSelectedDetail() {
        deselectAnnotation()
        isPresentingDetail = false
    }

    private func startMapObserevers() {
        fetchLocationItemsUseCase.execute()
            .map { $0.map { locationItem in Annotation(annotationItem: locationItem) } }
            .receive(on: RunLoop.main)
            .assign(to: &$locationAnnotations)

    }
}

private extension MapViewModel {
    enum AnnotationAsset: String {
        case landmark, scenicView, museum

        var image: ImageAsset {
            switch self {
            case .landmark:
                return Asset.Images.AnnotationsIcons.rosette
            case .scenicView:
                return Asset.Images.AnnotationsIcons.mountain2
            case .museum:
                return Asset.Images.AnnotationsIcons.buildingColumns
            }
        }

        var color: ColorAsset? {
            switch self {
            default:
                return Asset.Colors.Main.primary
            }
        }
    }
}
