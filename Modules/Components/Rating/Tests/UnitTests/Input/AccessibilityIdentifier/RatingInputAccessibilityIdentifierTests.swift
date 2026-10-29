//
//  RatingInputAccessibilityIdentifierTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 08/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@testable import SparkComponentRating

@Suite("Rating Input Accessibility Identifier Tests")
struct RatingInputAccessibilityIdentifierTests {

    // MARK: - Tests

    @Test("Identifier deprecated property")
    func identifierDeprecatedProperty() {
        // GIVEN / WHEN
        let identifier = RatingInputAccessibilityIdentifier.identifier

        // THEN
        #expect(identifier == "spark-rating-input")
    }

    @Test("View property")
    func viewProperty() {
        // GIVEN / WHEN
        let viewIdentifier = RatingInputAccessibilityIdentifier.view

        // THEN
        #expect(viewIdentifier == "spark-rating-input")
    }
}
