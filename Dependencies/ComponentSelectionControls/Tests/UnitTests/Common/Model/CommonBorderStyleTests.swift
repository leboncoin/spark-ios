//
//  CommonBorderStyleTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 22/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls

final class CommonBorderStyleTests: XCTestCase {

    // MARK: - Initialization Tests

    func test_initialization_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let borderStyle = CommonBorderStyle()

        // THEN
        XCTAssertEqual(borderStyle.width, 0)
        XCTAssertEqual(borderStyle.cornerRadius, 0)
    }

    func test_initialization_withCustomValues_shouldUseProvidedValues() {
        // GIVEN
        let customWidth: CGFloat = 2.0
        let customCornerRadius: CGFloat = 8.0

        // WHEN
        let borderStyle = CommonBorderStyle(
            width: customWidth,
            cornerRadius: customCornerRadius
        )

        // THEN
        XCTAssertEqual(borderStyle.width, customWidth)
        XCTAssertEqual(borderStyle.cornerRadius, customCornerRadius)
    }
}
