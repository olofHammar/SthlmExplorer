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
    var viewModel: ListViewModel!

    override func setUp() {
        super.setUp()
        viewModel = ListViewModel()
    }

    func test_list_items_is_equal_to_static_data_after_starting_oberservers() {
        // Given
        let expectation = XCTestExpectation(description: "List items should be equal to the combined count of CardList.json and TravelTip.json.")

        // When
        viewModel.startListItemObservers()

        let timeout = TimeInterval(2)
        let listItemCount = 3

        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + timeout) {
            XCTAssertEqual(self.viewModel.listItems.count, listItemCount)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: timeout)
    }

    func test_favorite_location_binding() {
        // Given
        let locationItem = LocationItem(location: Location.mockLocation, isFavorite: false)
        let expectedFavoriteValue = true

        // When
        viewModel.favoriteBinding(locationItem).wrappedValue = expectedFavoriteValue

        // Then
        XCTAssertTrue(viewModel.isFavoriteLocation(locationItem.id))
    }
}
