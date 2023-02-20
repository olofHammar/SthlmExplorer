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

    private func makeSUT() -> ListViewModel {
        ListViewModel()
    }
}
