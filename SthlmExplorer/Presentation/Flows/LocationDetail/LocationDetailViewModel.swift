//
//  LocationDetailViewModel.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-14.
//

import Combine
import Domain
import Model
import Navigation
import ShortcutFoundation
import SwiftUI

final class LocationDetailViewModel: ObservableObject {
    @Inject var viewStateManager: IViewStateManager
    @Inject private var favoriteLocationUseCase: IFavoriteLocationUseCase

    @Published private(set) var isAnimatingInfoSection = false
    @Published private(set) var isShowingNavBarWithTitle = false
    
    @Published var location: Location
    @Published var isFavorite: Bool

    private var cancellables = Set<AnyCancellable>()

    init(
        locationItem: LocationItem
    ) {
        self.location = locationItem.location
        self.isFavorite = locationItem.isFavorite

        $isFavorite
            .dropFirst(1)
            .receive(on: RunLoop.main)
            .sink { [unowned self] newValue in
                self.favoriteLocationUseCase.toggleFavorite(location.id, isOn: !newValue)
            }
            .store(in: &cancellables)
    }

    func dismissSelectedDetail() {
        viewStateManager.dismissSelectedDetail()
    }

    func prepareAnimationForInfoSection() {
        isAnimatingInfoSection = true
    }

    func resetAnimationForInfoSection() {
        isAnimatingInfoSection = false
        isShowingNavBarWithTitle = false
    }
}
