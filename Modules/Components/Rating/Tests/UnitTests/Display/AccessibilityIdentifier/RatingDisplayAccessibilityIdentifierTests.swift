//
//  RatingDisplayAccessibilityIdentifierTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 08/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@testable import SparkComponentRating

@Suite("Rating Display Accessibility Identifier Tests")
struct RatingDisplayAccessibilityIdentifierTests {

    // MARK: - Tests

    @Test("Identifier deprecated property")
    func identifierDeprecatedProperty() {
        // GIVEN / WHEN
        let identifier = RatingDisplayAccessibilityIdentifier.identifier

        // THEN
        #expect(identifier == "spark-rating-display")
    }

    @Test("View property")
    func viewProperty() {
        // GIVEN / WHEN
        let viewIdentifier = RatingDisplayAccessibilityIdentifier.view

        // THEN
        #expect(viewIdentifier == "spark-rating-display")
    }

    @Test("Text property")
    func textProperty() {
        // GIVEN / WHEN
        let textIdentifier = RatingDisplayAccessibilityIdentifier.text

        // THEN
        #expect(textIdentifier == "spark-rating-display-text")
    }
}
