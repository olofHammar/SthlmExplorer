//
//  RootViewModel.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-09.
//

import Combine
import Domain
import Location
import Model
import Navigation
import ShortcutFoundation
import SwiftUI

final class RootViewModel: ObservableObject {
    @Inject var viewStateManager: IViewStateManager
    @Inject var locationManager: ILocationManager

    @Published var selectedTab: TabBarSelection = .list
    @Published private(set) var isPresentingDetail = false

    private var cancellables = Set<AnyCancellable>()

    init() {
        locationManager.requestLocationPermission()

        viewStateManager.viewStatePublisher
            .receive(on: RunLoop.main)
            .sink { (state) in
                self.handleViewStates(state)
            }
            .store(in: &cancellables)
    }
}

private extension RootViewModel {
    func handleViewStates(_ state: ViewState) {
        switch state {
        case .presentedLocationDetail:
            withAnimation(.easeOut(duration: 0)) {
                self.isPresentingDetail = true
            }

        case .dismissedLocationDetail:
            withAnimation(.easeIn(duration: 0)) {
                self.isPresentingDetail = false
            }

        default:
            break
        }
    }
}
