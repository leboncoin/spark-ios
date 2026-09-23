//
//  ScaledBorderTypeTests.swift
//  SparkCommonTests
//
//  Created on 22/04/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkCommon

final class ScaledBorderTypeTests: XCTestCase {

    // MARK: - Tests

    func test_dash_properties() {
        // GIVEN / WHEN
        let borderType = ScaledBorderType.dash

        // THEN
        XCTAssertEqual(borderType.uiKitRelativeTo, .caption2, "Wrong uiKitRelativeTo when value is .dash")
        XCTAssertEqual(borderType.swiftUIRelativeTo, .caption2, "Wrong swiftUIRelativeTo when value is .dash")
        XCTAssertEqual(borderType.minValueFactor, 1, "Wrong minValueFactor when value is .dash")
        XCTAssertEqual(borderType.maxValueFactor, 1.75, "Wrong maxValueFactor when value is .dash")
    }

    func test_radius_properties() {
        // GIVEN / WHEN
        let borderType = ScaledBorderType.radius

        // THEN
        XCTAssertEqual(borderType.uiKitRelativeTo, .body, "Wrong uiKitRelativeTo when value is .radius")
        XCTAssertNil(borderType.swiftUIRelativeTo, "Wrong swiftUIRelativeTo when value is .radius")
        XCTAssertEqual(borderType.minValueFactor, 1, "Wrong minValueFactor when value is .radius")
        XCTAssertEqual(borderType.maxValueFactor, 1.2, "Wrong maxValueFactor when value is .radius")
    }

    func test_width_properties() {
        // GIVEN / WHEN
        let borderType = ScaledBorderType.width

        // THEN
        XCTAssertEqual(borderType.uiKitRelativeTo, .caption2, "Wrong uiKitRelativeTo when value is .radius")
        XCTAssertEqual(borderType.swiftUIRelativeTo, .caption2, "Wrong swiftUIRelativeTo when value is .radius")
        XCTAssertEqual(borderType.minValueFactor, 1, "Wrong minValueFactor when value is .radius")
        XCTAssertEqual(borderType.maxValueFactor, 1.75, "Wrong maxValueFactor when value is .radius")
    }
}
