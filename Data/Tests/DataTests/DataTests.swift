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
    var sut: StaticLocationItemDataSource!

    override func setUp() {
        super.setUp()
        sut = StaticLocationItemDataSource()
    }

    func test_static_data_count_is_two() throws {
        let sut = StaticLocationItemDataSource()

        let publisher = sut.getLocationItems()

        let locations = try preloadedValueInPublisher(publisher)
        XCTAssertEqual(locations.count, 2)
    }
}
