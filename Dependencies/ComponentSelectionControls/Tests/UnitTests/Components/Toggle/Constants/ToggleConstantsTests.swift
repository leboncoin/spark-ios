//
//  ToggleConstantsTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 14/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls

final class ToggleConstantsTests: XCTestCase {

    // MARK: - Tests

    func test_toggleDotImagePadding() {
        XCTAssertEqual(
            ToggleConstants.toggleDotImagePadding,
            5
        )
    }

    func test_toggleSizes_width() {
        XCTAssertEqual(
            ToggleConstants.width,
            56
        )
    }

    func test_toggleSizes_height() {
        XCTAssertEqual(
            ToggleConstants.height,
            32
        )
    }

    func test_toggleSizes_dotSize() {
        XCTAssertEqual(
            ToggleConstants.dotSize,
            ToggleConstants.height
        )
    }

    func test_toggleSizes_dotPressedSize() {
        XCTAssertEqual(
            ToggleConstants.dotPressedSize,
            ToggleConstants.width * 0.75
        )
    }

    func test_toggleSizes_dotIncreasePressedSize() {
        XCTAssertEqual(
            ToggleConstants.dotIncreasePressedSize,
            10
        )
    }

    func test_toggleSizes_padding() {
        XCTAssertEqual(
            ToggleConstants.padding,
            4
        )
    }

    func test_toggleSizes_dotIconSize() {
        XCTAssertEqual(
            ToggleConstants.dotIconSize,
            14
        )
    }
}
