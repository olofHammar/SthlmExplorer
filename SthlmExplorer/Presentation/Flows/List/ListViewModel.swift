//
//  ListViewModel.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-10.
//

import Combine
import Domain
import Location
import Navigation
import Model
import ShortcutFoundation
import SwiftUI

final class ListViewModel: ObservableObject {
    @Inject var viewStateManager: IViewStateManager
    @Inject var locationManager: ILocationManager

    @Inject private var fetchLocationItemsUseCase: IFetchLocationItemsUseCase
    @Inject private var favoriteLocationUseCase: IFavoriteLocationUseCase
    @Inject private var fetchTravelTipItemsUseCase: IFetchTravelTipItemsUseCase

    @Published private(set) var listItems: [ListItem] = []
    @Published private(set) var allLocationItems: [LocationItem] = []
    @Published private(set) var locationItems: [LocationItem] = []
    @Published private(set) var travelTipItems: [TravelTipItem] = []
    @Published private(set) var selectedLocation: LocationItem?

    @Published private(set) var isLoading = false
    @Published private(set) var isPresentingLocationDetail = false
    @Published private(set) var isHeaderSectionDismissed = false
    @Published var isPresentingExpandedSearchBar = false

    @Published var searchBarText = String.empty
    @Published var selectedFilter: LocationFilter = .all
    @Published var headerOffset: CGFloat = .zero

    private var cancellables = Set<AnyCancellable>()

    init() {
        startListItemObservers()
    }

    // MARK: - Publishers

    func startListItemObservers() {
        fetchLocationItemsUseCase.execute()
            .receive(on: RunLoop.main)
            .assign(to: &$allLocationItems)

        $locationItems
            .combineLatest(fetchTravelTipItemsUseCase.execute())
            .map { self.sortListItems(locationItems: $0.0, travelTips: $0.1) }
            .receive(on: RunLoop.main)
            .assign(to: &$listItems)

        $searchBarText
            .combineLatest($allLocationItems)
            .debounce(for: .seconds(0.3), scheduler: DispatchQueue.main)
            .map(filterBySearchLocations)
            .combineLatest($selectedFilter)
            .map(filterByType)
            .receive(on: RunLoop.main)
            .sink { [unowned self] (returnedLocations) in
                self.locationItems = returnedLocations
            }
            .store(in: &cancellables)
    }

    // MARK: - View Helpers

    func favoriteBinding(_ locationItem: LocationItem) -> Binding<Bool> {
        Binding {
            withAnimation {
                self.favoriteLocationUseCase.isFavorite(locationItem.id)
            }
        } set: { isFavorite in
            withAnimation {
                self.favoriteLocationUseCase.toggleFavorite(locationItem.id, isOn: locationItem.isFavorite)
                self.selectedLocation?.isFavorite.toggle()
            }
        }
    }

    func headerOffsetValue() -> CGFloat {
        let navBarDifference = .expandedHeaderHeight - .compressedHeaderHeight
        let offsetValue = -headerOffset < navBarDifference ? headerOffset : -navBarDifference

        guard !isPresentingExpandedSearchBar else {
            return -navBarDifference
        }

        return headerOffset < 0 ? offsetValue : 0
    }

    func headerOffsetProgress() -> CGFloat {
        let navBarDifference = .expandedHeaderHeight - (.compressedHeaderHeight + .x7)
        let topHeight = navBarDifference
        let progress = headerOffsetValue() / topHeight

        return progress
    }

    func isSelectedLocation(_ locationItem: LocationItem) -> Bool {
        isPresentingLocationDetail && locationItem.id == selectedLocation?.id
    }

    func opacityForLocationCard(_ locationItem: LocationItem) -> Double {
        isPresentingLocationDetail ? (isSelectedLocation(locationItem) ? 1 : 0) : 1
    }

    // MARK: - Changing View State

    func shouldDisplayEmptyFavoritesState() -> Bool {
        locationItems.isEmpty && selectedFilter == .favorites
    }

    func shouldDisplayEmptySearchState() -> Bool {
        locationItems.isEmpty && !searchBarText.isEmpty
    }

    func presentDetail(for locationItem: LocationItem) {
        isPresentingExpandedSearchBar = false
        isHeaderSectionDismissed = true
        
        withAnimation(.easeOut(duration: 0)) {
            isPresentingLocationDetail = true
            viewStateManager.presentSelectedDetail(for: locationItem)
        }

        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
            selectedLocation = locationItem
        }
    }

    func dismissDetail() {
        isHeaderSectionDismissed = false
        
        withAnimation(.interactiveSpring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.7)) {
            viewStateManager.dismissSelectedDetail()
            isPresentingLocationDetail = false
            selectedLocation = nil
        }
    }

    // MARK: - List and Filter Helpers
    func distanceToLocation(_ locationItem: LocationItem) -> Int? {
        let distance = locationManager.calculateDistance(to: (locationItem.location.latitude, locationItem.location.longitude))

        guard distance != 0 else {
            return nil
        }

        return distance
    }

    private func sortListItems(locationItems: [LocationItem], travelTips: [TravelTipItem]) -> [ListItem] {
        var listItems = [ListItem]()

        locationItems.forEach { location in
            travelTips.forEach { travelTip in
                if (travelTip.order - 1) == locationItems.firstIndex(of: location) && !isPresentingExpandedSearchBar && selectedFilter == .all {
                    return listItems.append(.travelTip(travelTip))
                }
            }
            listItems.append(.location(location))
        }

        return listItems
    }

    private func filterBySearchLocations(text: String, locationItems: [LocationItem]) -> [LocationItem] {
        guard !text.isEmpty else { return locationItems }

        let lowercasedText = text.lowercased()

        return locationItems.filter { (locationItem) -> Bool in
            return locationItem.location.title.lowercased().contains(lowercasedText) ||
            locationItem.location.type.rawValue.lowercased().contains(lowercasedText) ||
            locationItem.location.subway.lowercased().contains(lowercasedText)
        }
    }

    private func filterByType(locationItems: [LocationItem], type: LocationFilter) -> [LocationItem] {
        guard type != .all else { return locationItems }

        if type == .favorites {
            return locationItems.filter { (locationItem) -> Bool in
                return locationItem.isFavorite
            }
        } else {
            return locationItems.filter { (locationItem) -> Bool in
                return locationItem.location.type.rawValue.lowercased() == type.searchKey.lowercased()
            }
        }
    }
}

// MARK: - Enum For Combining Card Types

extension ListViewModel {
    enum ListItem: Hashable, Identifiable {
        case location(LocationItem)
        case travelTip(TravelTipItem)

        var id: String {
            switch self {
            case .location(let location):
                return location.id
            case .travelTip(let travelTip):
                return travelTip.id
            }
        }
    }
}
