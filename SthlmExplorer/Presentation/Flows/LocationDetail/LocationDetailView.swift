//
//  LocationDetailView.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-14.
//

import Model
import SwiftUI

struct LocationDetailView: View {
    @StateObject private var vm = LocationDetailViewModel()

    let locationItem: LocationItem
    let parentAnimation: Namespace.ID

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            LocationCardView(
                location: locationItem.location,
                isFavorite: .constant(false),
                animation: parentAnimation,
                isDetail: true
            )
            .overlay(alignment: .topTrailing) {
                Button("", action: { vm.dismissSelectedDetail() })
                    .buttonStyle(IconButtonStyle(systemImage: .xMark))
                    .padding(.top, .x5)
                    .padding(.trailing, .x2)
            }

            Spacer()
        }
        .ignoresSafeArea(edges: .top)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .transition(.identity)
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    @Namespace static var animation

    static var previews: some View {
        LocationDetailView(
            locationItem: LocationItem.init(location: .mockLocation, isFavorite: false),
            parentAnimation: animation)
    }
}
