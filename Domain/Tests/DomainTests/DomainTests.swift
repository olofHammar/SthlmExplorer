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
    var sut: StaticFetchLocationItemsUseCase!

    override func setUp() {
        super.setUp()
        sut = StaticFetchLocationItemsUseCase()
    }

    func test_static_data_count_is_two() throws {
        let sut = StaticFetchLocationItemsUseCase()

        let publisher = sut.execute()

        let locations = try preloadedValueInPublisher(publisher)
        XCTAssertEqual(locations.count, 2)
    }
}
