//
//  ListViewModel.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-10.
//

import Combine
import Domain
import Model
import ShortcutFoundation
import SwiftUI

final class ListViewModel: ObservableObject {
    @Inject private var fetchListItemsUseCase: IFetchLocationItemsUseCase
    @Inject private var favoriteLocationUseCase: IFavoriteLocationUseCase
    @Inject private var fetchTravelTipItemsUseCase: IFetchTravelTipItemsUseCase

    @Published private(set) var listItems: [ListItem] = []
    @Published private(set) var allLocationItems: [LocationItem] = []
    @Published private(set) var locationItems: [LocationItem] = []
    @Published private(set) var travelTipItems: [TravelTipItem] = []

    @Published private(set) var isLoading = false
    @Published var isPresentingExpandedSearchBar = false

    @Published var searchBarText = String.empty
    @Published var selectedFilter: LocationFilter = .all
    @Published var headerOffset: CGFloat = .zero

    private var cancellables = Set<AnyCancellable>()

    init() {
        fetchListItems()
    }

    func fetchListItems() {
        fetchListItemsUseCase.execute()
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

    func favoriteBinding(_ locationItem: LocationItem) -> Binding<Bool> {
        Binding {
            withAnimation {
                self.favoriteLocationUseCase.isFavorite(locationItem.id)
            }
        } set: { isFavorite in
            withAnimation {
                self.favoriteLocationUseCase.toggleFavorite(locationItem.id, isOn: locationItem.isFavorite)
            }
        }
    }

    func headerOffsetValue() -> CGFloat {
        let navBarDifference = .headerExpanded - .headerCollapsed
        let offsetValue = -headerOffset < navBarDifference ? headerOffset : -navBarDifference

        guard !isPresentingExpandedSearchBar else {
            return -navBarDifference
        }

        return headerOffset < 0 ? offsetValue : 0
    }

    func headerOffsetProgress() -> CGFloat {
        let navBarDifference = .headerExpanded - (.headerCollapsed + .x7)
        let topHeight = navBarDifference
        let progress = headerOffsetValue() / topHeight

        return progress
    }

    func shouldDisplayEmptyFavoritesState() -> Bool {
        locationItems.isEmpty && selectedFilter == .favorites
    }

    func shouldDisplayEmptySearchState() -> Bool {
        locationItems.isEmpty && !searchBarText.isEmpty
    }

    // MARK: Private functions
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
            locationItem.location.type.rawValue.lowercased().contains(lowercasedText)
//            ||
//            locationItem.location.subway.lowercased().contains(lowercasedText)
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
