//
//  CircularMeterAccessibilityIdentifierTests.swift
//  SparkComponentCircularMeterTests
//
//  Created by robin.lemaire on 28/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentCircularMeter

@Suite("Circular Meter Accessibility Identifier Tests")
struct CircularMeterAccessibilityIdentifierTests {

    // MARK: - Tests

    @Test("View identifier")
    func viewIdentifier() {
        // GIVEN / WHEN / THEN
        #expect(CircularMeterAccessibilityIdentifier.view == "spark-circularmeter-view")
    }
}
