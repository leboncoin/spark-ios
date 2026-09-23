//
//  RatingInputAccessibilityIdentifierTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 08/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import XCTest
@testable import SparkComponentRating

final class RatingInputAccessibilityIdentifierTests: XCTestCase {

    // MARK: - Tests

    func test_identifier_deprecated_property() {
        // GIVEN / WHEN
        let identifier = RatingInputAccessibilityIdentifier.identifier

        // THEN
        XCTAssertEqual(identifier, "spark-rating-input")
    }

    func test_view_property() {
        // GIVEN / WHEN
        let viewIdentifier = RatingInputAccessibilityIdentifier.view

        // THEN
        XCTAssertEqual(viewIdentifier, "spark-rating-input")
    }
}
