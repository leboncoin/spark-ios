//
//  CommonConstantsTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 14/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls

final class CommonConstantsTests: XCTestCase {

    // MARK: - Animation

    func test_animationDuration() {
        XCTAssertEqual(
            CommonConstants.animationDuration,
            0.2
        )
    }

    func test_toggleSizes_hoverPadding() {
        XCTAssertEqual(
            CommonConstants.hoverPadding,
            4
        )
    }

    // MARK: - Scaled

    func test_scaled_minFactor() {
        XCTAssertEqual(
            CommonConstants.Scaled.minFactor,
            0.85
        )
    }

    func test_scaled_maxFactor() {
        XCTAssertEqual(
            CommonConstants.Scaled.maxFactor,
            1.33
        )
    }
}
