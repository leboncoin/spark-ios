//
//  DotIndicatorAccessibilityIdentifierTests.swift
//  SparkComponentDotIndicatorTests
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentDotIndicator

// MARK: - Tests

struct DotIndicatorAccessibilityIdentifierTests {

    @Test("View should return expected identifier")
    func viewShouldReturnExpectedIdentifier() {
        #expect(DotIndicatorAccessibilityIdentifier.view == "spark-dot-indicator-view")
    }

    @Test("Dot should return expected identifier", arguments: [0, 3])
    func dotShouldReturnExpectedIdentifier(index: Int) {
        #expect(DotIndicatorAccessibilityIdentifier.dot(index: index) == "spark-dot-indicator-dot-\(index)")
    }
}
