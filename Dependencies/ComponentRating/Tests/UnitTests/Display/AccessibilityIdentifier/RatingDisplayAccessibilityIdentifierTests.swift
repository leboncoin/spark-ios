//
//  RatingDisplayAccessibilityIdentifierTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 08/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import XCTest
@testable import SparkComponentRating

final class RatingDisplayAccessibilityIdentifierTests: XCTestCase {

    // MARK: - Tests

    func test_identifier_deprecated_property() {
        // GIVEN / WHEN
        let identifier = RatingDisplayAccessibilityIdentifier.identifier

        // THEN
        XCTAssertEqual(identifier, "spark-rating-display")
    }

    func test_view_property() {
        // GIVEN / WHEN
        let viewIdentifier = RatingDisplayAccessibilityIdentifier.view

        // THEN
        XCTAssertEqual(viewIdentifier, "spark-rating-display")
    }

    func test_text_property() {
        // GIVEN / WHEN
        let textIdentifier = RatingDisplayAccessibilityIdentifier.text

        // THEN
        XCTAssertEqual(textIdentifier, "spark-rating-display-text")
    }
}
