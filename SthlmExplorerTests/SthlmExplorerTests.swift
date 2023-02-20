//
//  SthlmExplorerTests.swift
//  SthlmExplorerTests
//
//  Created by Olof Hammar on 2023-02-08.
//

import Model
import XCTest
@testable import Data
@testable import Domain
@testable import SthlmExplorer
@testable import Navigation

final class ListViewModelTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    func test_list_items_is_equal_to_static_data_after_starting_oberservers() {
        // Given
        let vm = makeSUT()
        let expectation = XCTestExpectation(description: "List items should be equal to the combined count of CardList.json and TravelTip.json.")

        // When
        vm.startListItemObservers()

        let timeout = TimeInterval(1)
        let listItemCount = 3

        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + timeout) {
            XCTAssertEqual(vm.listItems.count, listItemCount)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: timeout)
    }

    func test_favorite_location_binding_is_toggled_correctly() {
        // Given
        let vm = makeSUT()
        let locationItem = LocationItem(location: Location.mockLocation, isFavorite: false)
        let expectedFavoriteValue = true

        // When
        vm.favoriteBinding(locationItem).wrappedValue = expectedFavoriteValue

        // Then
        XCTAssertTrue(vm.isFavoriteLocation(locationItem.id))
    }

    func test_header_offset_value_is_initialised_correctly() {
        // Given
        let vm = makeSUT()
        let expectedOffsetValue: CGFloat = .zero

        // When
        let actualOffsetValue = vm.headerOffsetValue()

        // Then
        XCTAssertEqual(expectedOffsetValue, actualOffsetValue)
    }

    func test_selected_location_is_set_when_detail_is_presented() {
        // Given
        let vm = makeSUT()
        let selectedLocation = LocationItem(location: .mockLocation, isFavorite: false)

        // When
        vm.presentDetail(for: selectedLocation)

        // Then
        XCTAssertEqual(selectedLocation, vm.selectedLocation)
    }

    func test_location_card_opacity_is_one_when_selected_detail_is_nil() {
        // Given
        let vm = makeSUT()
        let location = LocationItem(location: .mockLocation, isFavorite: false)

        // When
        XCTAssertNil(vm.selectedLocation)

        // Then
        XCTAssertEqual(vm.opacityForLocationCard(location), 1)
    }

    func test_location_card_opacity_is_set_to_one_for_selected_and_zero_for_unselected() {
        // Given
        let vm = makeSUT()
        let unselectedLocation = LocationItem(location: .emptyLocation, isFavorite: false)
        let selectedLocation = LocationItem(location: .mockLocation, isFavorite: false)

        // When
        vm.presentDetail(for: selectedLocation)

        // Then
        XCTAssertEqual(vm.opacityForLocationCard(unselectedLocation), 0)
        XCTAssertEqual(vm.opacityForLocationCard(selectedLocation), 1)
    }

    func test_should_display_empty_state_for_favorites() {
        // Given
        let vm = makeSUT()

        // When
        vm.selectedFilter = .landmarks

        // Then
        XCTAssertFalse(vm.shouldDisplayEmptyFavoritesState())

        // WHen
        vm.selectedFilter = .favorites

        // Then
        XCTAssertTrue(vm.shouldDisplayEmptyFavoritesState())
    }

    func test_should_diplay_empty_searchbar_state() {
        // Given
        let vm = makeSUT()

        // When
        vm.searchBarText = "Someone is searching for a specific location which is not found..."

        // Then
        XCTAssertTrue(vm.shouldDisplayEmptySearchState())
    }

    func test_view_state_manager_changes_state_when_presenting_location_detail() {
        // Given
        let vm = makeSUT()
        let locationItem = LocationItem(location: .mockLocation, isFavorite: false)
        let expectation = XCTestExpectation()
        var viewState: ViewState?

        // When
        // Ignoring the initial value and listening for the next value change.
        let subscription = vm.viewStateManager.viewStatePublisher
            .dropFirst(1)
            .sink { state in
                viewState = state
                expectation.fulfill()
            }

        vm.presentDetail(for: locationItem)

        // Then
        let isPresentingDetail = (viewState == .presentedLocationDetail)
        subscription.cancel()
        XCTAssertTrue(isPresentingDetail)

        wait(for: [expectation], timeout: 1)
    }

    func test_view_state_manager_changes_state_when_dismissing_location_detail() {
        // Given
        let vm = makeSUT()
        let expectation = XCTestExpectation()
        var viewState: ViewState?

        // When
        let subscription = vm.viewStateManager.viewStatePublisher
            .dropFirst(1)
            .sink { state in
                viewState = state
                expectation.fulfill()
            }

        vm.dismissDetail()
        let didDismissDetail = (viewState == .dismissedLocationDetail)
        subscription.cancel()
        XCTAssertTrue(didDismissDetail)

        wait(for: [expectation], timeout: 1)
    }

    func test_calculate_distance_returns_value_in_minutes() {
        // Given
        let vm = makeSUT()
        let location = LocationItem(location: .mockLocation, isFavorite: false)

        // When
        if let distance = vm.distanceToLocation(location) {
            // Then
            XCTAssertGreaterThan(distance, 0)
        } else {
            // Then
            XCTFail("distance is nil")
        }
    }

    private func makeSUT() -> ListViewModel {
        ListViewModel()
    }
}
