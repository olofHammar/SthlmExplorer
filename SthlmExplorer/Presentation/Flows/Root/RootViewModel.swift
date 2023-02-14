//
//  RootViewModel.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-09.
//

import Combine
import Domain
import Model
import Navigation
import ShortcutFoundation
import SwiftUI

final class RootViewModel: ObservableObject {
    @Inject var viewStateManager: IViewStateManager

    @Published var selectedTab: TabBarSelection = .list

    @Published private(set) var isAnimatingView = false
    @Published private(set) var isPresentingDetail = false
    @Published private(set) var selectedLocation: LocationItem?

    private var cancellables = Set<AnyCancellable>()

    init() {
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
        case .presentedLocationDetail(let location):
            self.isAnimatingView = true

            withAnimation(.easeInOut) {
                self.isPresentingDetail = true
                self.selectedLocation = location
            }

        case .dismissedLocationDetail:
            self.isAnimatingView = false

            withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.7, blendDuration: 0.6)) {
                self.isPresentingDetail = false
                self.selectedLocation = nil
            }

        case .presentedLocationSheet(let location):
            self.selectedLocation = location

        case .dismissedLocationSheet:
            self.selectedLocation = nil

        default:
            break
        }
    }
}
