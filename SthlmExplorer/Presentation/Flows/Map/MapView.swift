//
//  MapView.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-10.
//

import MapKit
import Model
import ShortcutFoundation
import ShortcutSwiftUI
import SwiftUI

struct MapView: View {
    @InjectObject private var vm: MapViewModel

    @Namespace private var mapAnimation

    var body: some View {
        ZStack(alignment: .topLeading) {
            MapViewRepresentable(
                annotations: vm.locationAnnotations,
                selectedAnnotation: vm.selectedAnnotation,
                isCenteringUseLocation: vm.isCenteringUserLocation,
                isPresentingDirections: vm.isPresentingDirections
            )
            .bottomSheet(
                item: $vm.selectedAnnotation,
                options: [
                    .background(Color.clear.eraseToAnyView()),
                    .noDragIndicator,
                    .elementsPadding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)),
                    .tapToDismiss
                ], content: { annotation in
                    VStack(spacing: 0) {
                        Spacer()

                        selectedLocationSheetView(for: annotation.annotationItem)
                    }
                })

            if let selectedLocationItem = vm.selectedAnnotation?.annotationItem, vm.isPresentingDetail {
                selectedLocationFullscreenView(for: selectedLocationItem)
            }
        }
        .ignoresSafeArea()
    }

    @ViewBuilder
    private func selectedLocationSheetView(for locationItem: LocationItem) -> some View {
        VStack(spacing: .x2) {
            LocationCardView(
                isFavorite: vm.favoriteBinding(locationItem),
                location: locationItem.location,
                animation: mapAnimation
            )

            LocationSheetBottomView(
                onExpand: { vm.presentSelectedDetail() },
                onDismiss: { vm.deselectAnnotation() }
            )
        }
        .padding([.top, .horizontal], .x2)
        .padding(.bottom, .x8)
        .background(Asset.Colors.Background.b100.swiftUIColor)
        .cornerRadius(.x2, corners: [.topLeft, .topRight])
    }

    @ViewBuilder
    private func selectedLocationFullscreenView(for locationItem: LocationItem) -> some View {
        ScrollView(showsIndicators: false) {
            VStack {
                LocationCardView(
                    isFavorite: vm.favoriteBinding(locationItem),
                    location: locationItem.location,
                    animation: mapAnimation
                )

                LocationDetailView(
                    location: locationItem.location,
                    distance: 0,
                    onClose: { vm.dismissSelectedDetail() }
                )
            }
            .padding(.top, .x10)
            .padding(.horizontal, .x2)
        }
        .background(Asset.Colors.Background.b100.just())
        .transition(.identity)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}


struct BottomSheet: View {

    @Binding var isShowing: Bool
    var content: AnyView

    var body: some View {
        ZStack(alignment: .bottom) {
            if (isShowing) {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing.toggle()
                    }
                content
                    .padding(.bottom, 42)
                    .transition(.move(edge: .bottom))
                    .background(
                        Color(uiColor: .white)
                    )
                    .cornerRadius(.x2, corners: [.topLeft, .topRight])
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut, value: isShowing)
    }
}
