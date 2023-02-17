//
//  DataTests.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-08.
//

import Combine
@testable import Data
import XCTest

final class DataTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    // MARK: - Test Locations Data Source
    func test_static_locations_data_count_is_two() throws {
        let sut = StaticLocationsDataSource()

        let publisher = sut.getLocations()

        let locations = try preloadedValueInPublisher(publisher)
        XCTAssertEqual(locations.count, 2)
    }

    // MARK: - Test Travel Tips Data Source
    func test_static_travel_tips_data_count_is_one() throws {
        let sut = StaticTravelTipsDataSource()

        let publisher = sut.getTravelTips()

        let travelTips = try preloadedValueInPublisher(publisher)
        XCTAssertEqual(travelTips.count, 1)
    }
}
