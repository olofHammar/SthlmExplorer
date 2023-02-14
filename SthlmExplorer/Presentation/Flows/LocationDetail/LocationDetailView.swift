//
//  LocationDetailView.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-14.
//

import SwiftUI

struct LocationDetailView: View {
    @StateObject private var vm = LocationDetailViewModel()

    var body: some View {
        VStack(spacing: 50) {
            Text("Location Detail View")

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
        LocationDetailView()
    }
}
