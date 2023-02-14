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

    var body: some View {
        VStack(spacing: 50) {
            Text(locationItem.location.title)

            Button("Close") {
                vm.dismissSelectedDetail()
            }
            .padding(.x2)
            .background(Color.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue)
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(locationItem: LocationItem.init(location: .mockLocation, isFavorite: false))
    }
}
