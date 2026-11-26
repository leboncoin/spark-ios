//
//  DotsIndicatorAccessibilityIdentifierTests.swift
//  SparkComponentDotsIndicatorTests
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentDotsIndicator

// MARK: - Tests

struct DotsIndicatorAccessibilityIdentifierTests {

    @Test("View should return expected identifier")
    func viewShouldReturnExpectedIdentifier() {
        #expect(DotsIndicatorAccessibilityIdentifier.view == "spark-dots-indicator-view")
    }

    @Test("Dot should return expected identifier", arguments: [0, 3])
    func dotShouldReturnExpectedIdentifier(index: Int) {
        #expect(DotsIndicatorAccessibilityIdentifier.dot(index: index) == "spark-dots-indicator-dot-\(index)")
    }
}
