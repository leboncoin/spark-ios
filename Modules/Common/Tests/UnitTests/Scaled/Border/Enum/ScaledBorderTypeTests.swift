//
//  ScaledBorderTypeTests.swift
//  SparkCommonTests
//
//  Created on 22/04/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkCommon

@Suite("Scaled Border Type Tests")
struct ScaledBorderTypeTests {

    // MARK: - Tests

    @Test("Dash properties")
    func dashProperties() {
        // GIVEN / WHEN
        let borderType = ScaledBorderType.dash

        // THEN
        #expect(borderType.uiKitRelativeTo == .caption2, "Wrong uiKitRelativeTo when value is .dash")
        #expect(borderType.swiftUIRelativeTo == .caption2, "Wrong swiftUIRelativeTo when value is .dash")
        #expect(borderType.minValueFactor == 1, "Wrong minValueFactor when value is .dash")
        #expect(borderType.maxValueFactor == 1.75, "Wrong maxValueFactor when value is .dash")
    }

    @Test("Radius properties")
    func radiusProperties() {
        // GIVEN / WHEN
        let borderType = ScaledBorderType.radius

        // THEN
        #expect(borderType.uiKitRelativeTo == .body, "Wrong uiKitRelativeTo when value is .radius")
        #expect(borderType.swiftUIRelativeTo == nil, "Wrong swiftUIRelativeTo when value is .radius")
        #expect(borderType.minValueFactor == 1, "Wrong minValueFactor when value is .radius")
        #expect(borderType.maxValueFactor == 1.2, "Wrong maxValueFactor when value is .radius")
    }

    @Test("Width properties")
    func widthProperties() {
        // GIVEN / WHEN
        let borderType = ScaledBorderType.width

        // THEN
        #expect(borderType.uiKitRelativeTo == .caption2, "Wrong uiKitRelativeTo when value is .radius")
        #expect(borderType.swiftUIRelativeTo == .caption2, "Wrong swiftUIRelativeTo when value is .radius")
        #expect(borderType.minValueFactor == 1, "Wrong minValueFactor when value is .radius")
        #expect(borderType.maxValueFactor == 1.75, "Wrong maxValueFactor when value is .radius")
    }
}
