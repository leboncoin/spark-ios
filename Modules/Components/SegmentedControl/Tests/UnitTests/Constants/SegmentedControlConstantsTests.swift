//
//  SegmentedControlConstantsTests.swift
//  SparkComponentSegmentedControlTests
//
//  Created by robin.lemaire on 23/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSegmentedControl
import Testing

// MARK: - Tests

struct SegmentedControlConstantsTests {

    @Test("Animation duration has expected value")
    func animationDuration_hasExpectedValue() {
        // GIVEN / WHEN
        let animationDuration = SegmentedControlConstants.animationDuration

        // THEN
        #expect(animationDuration == 0.15)
    }
}
