//
//  DividerAxisTests.swift
//  SparkComponentDividerTests
//
//  Created by robin.lemaire on 12/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import UIKit

@testable import SparkComponentDivider

@MainActor
@Suite("Divider Axis Tests")
struct DividerAxisTests {

    // MARK: - Tests

    @Test("All cases")
    func allCases() {
        // GIVEN
        let expectedCases: [DividerAxis] = [.horizontal, .vertical]

        // WHEN
        let allCases = DividerAxis.allCases

        // THEN
        #expect(allCases.count == 2, "DividerAxis should have 2 cases")
        #expect(allCases == expectedCases, "DividerAxis allCases should match expected cases")
    }

    @Test("Default")
    func defaultValue() {
        // GIVEN & WHEN
        let defaultAxis = DividerAxis.default

        // THEN
        #expect(defaultAxis == .horizontal, "DividerAxis.default should be .horizontal")
    }

    @Test("Uikit")
    func uikit() {
        // GIVEN
        let axis1 = DividerAxis.horizontal
        let axis2 = DividerAxis.vertical

        // WHEN
        let uikitAxis1 = axis1.uikit
        let uikitAxis2 = axis2.uikit

        // THEN
        #expect(uikitAxis1 == .horizontal, "Wrong UIKit for uikitAxis1")
        #expect(uikitAxis2 == .vertical, "Wrong UIKit for uikitAxis2")
    }
}
