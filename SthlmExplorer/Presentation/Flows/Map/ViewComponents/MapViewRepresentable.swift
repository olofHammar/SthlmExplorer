//
//  MapViewRepresentable.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-16.
//

import Location
import MapKit
import Model
import ShortcutFoundation
import SwiftUI
import UIKit

struct MapViewRepresentable: UIViewRepresentable {
    @Inject var vm: MapViewModel

    var annotations: [Annotation]
    var selectedAnnotation: Annotation?
    var isCenteringUseLocation: Bool
    var isPresentingDirections: Bool

    func makeUIView(context: Self.Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        mapView.setRegion(LocationManager.stockholmOverviewRegion(), animated: false)

        return mapView
    }

    func updateUIView(_ view: MKMapView, context: Self.Context) {
        vm.updateMapView(view)
    }

    func makeCoordinator() -> MapViewCoordinator {
        MapViewCoordinator(self, viewModel: vm)
    }
}

extension MapViewRepresentable {

    class MapViewCoordinator: NSObject, MKMapViewDelegate {
        var mapViewController: MapViewRepresentable
        var viewModel: MapViewModel

        init(_ controller: MapViewRepresentable, viewModel: MapViewModel) {
            self.mapViewController = controller
            self.viewModel = viewModel
        }

        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            viewModel.mapView(mapView, viewFor: annotation)
        }

        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            viewModel.mapView(mapView, didSelect: view)
        }

        func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
            viewModel.mapView(mapView, didDeselect: view)
        }

        func mapView(_ mapView: MKMapView, clusterAnnotationForMemberAnnotations memberAnnotations: [MKAnnotation]) -> MKClusterAnnotation {
            viewModel.mapView(mapView, clusterAnnotationForMemberAnnotations: memberAnnotations)
        }

        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = UIColor(asset: Asset.Colors.Main.accent)?.withAlphaComponent(0.6)

            return renderer
        }
    }
}

extension MKMapView {
    func updateAnnotations(with selectedAnnotation: Annotation) {
        let oldAnnotations = self.annotations.compactMap({ $0 as? Annotation })
        let oldAnnotationsToRemove = oldAnnotations.filter( { $0.annotationItem.id != selectedAnnotation.annotationItem.id } )
        self.removeAnnotations(oldAnnotationsToRemove)
    }

    func disableMap() {
        self.isUserInteractionEnabled = false
    }

    func enableMap() {
        self.isUserInteractionEnabled = true
    }
}
