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

    @Test
    func iconSize_hasExpectedValue() {
        // GIVEN / WHEN
        let iconSize = SegmentedControlConstants.iconSize

        // THEN
        #expect(iconSize == 16)
    }

    @Test
    func minHeight_hasExpectedValue() {
        // GIVEN / WHEN
        let minHeight = SegmentedControlConstants.minHeight

        // THEN
        #expect(minHeight == 44)
    }

    @Test
    func separatorWidth_hasExpectedValue() {
        // GIVEN / WHEN
        let separatorWidth = SegmentedControlConstants.Separator.width

        // THEN
        #expect(separatorWidth == 1)
    }

    @Test
    func separatorHeight_hasExpectedValue() {
        // GIVEN / WHEN
        let separatorHeight = SegmentedControlConstants.Separator.height

        // THEN
        #expect(separatorHeight == 24)
    }
}
