//
//  NumberFormatter+SharedExtensionTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 15/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import XCTest
@testable import SparkComponentRating

final class NumberFormatterSharedExtensionTests: XCTestCase {

    // MARK: - Properties

    var formatter: NumberFormatter!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.formatter = NumberFormatter.shared
    }

    // MARK: - Tests

    func test_shared_formatter_configuration() {
        // GIVEN / WHEN
        let formatter = NumberFormatter.shared

        // THEN
        XCTAssertEqual(formatter.minimumFractionDigits, 0)
        XCTAssertEqual(formatter.maximumFractionDigits, 2)
    }

    func test_shared_formatter_is_singleton() {
        // GIVEN / WHEN
        let formatter1 = NumberFormatter.shared
        let formatter2 = NumberFormatter.shared

        // THEN
        XCTAssertTrue(formatter1 === formatter2)
    }
}
