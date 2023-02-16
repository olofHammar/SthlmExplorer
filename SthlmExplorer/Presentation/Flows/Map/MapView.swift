//
//  MapView.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-10.
//

import MapKit
import ShortcutFoundation
import ShortcutSwiftUI
import SwiftUI

struct MapView: View {
    @InjectObject private var vm: MapViewModel

    var body: some View {
        ZStack(alignment: .topLeading) {
            MapViewRepresentable(
                annotations: vm.locationAnnotations,
                selectedAnnotation: vm.selectedAnnotation,
                isCenteringUseLocation: vm.isCenteringUserLocation,
                isPresentingDirections: vm.isPresentingDirections
            )
        }
        .ignoresSafeArea()
        .onChange(of: vm.locationAnnotations) { newValue in
            print(newValue)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
