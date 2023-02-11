//
//  DataTests.swift
//  SthlmExplorer
//
//  Created by Olof Hammar on 2023-02-08.
//

import Combine
@testable import Domain
import Data
import XCTest

final class DomainTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    func test_static_locations_data_count_is_two() throws {
        let sut = StaticFetchLocationItemsUseCase()

        let publisher = sut.execute()

        let locations = try preloadedValueInPublisher(publisher)
        XCTAssertEqual(locations.count, 2)
    }

    func test_static_travel_tips_data_count_is_one() throws {
        let sut = StaticFetchTravelTipsUseCase()

        let publisher = sut.execute()

        let travelTips = try preloadedValueInPublisher(publisher)
        XCTAssertEqual(travelTips.count, 1)
    }
}
