//
//  ProgressBarIndeterminateConstantsTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 16/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@testable import SparkComponentProgressBar
import XCTest

final class ProgressBarIndeterminateConstantsTests: XCTestCase {

    // MARK: - Animation Tests

    func test_animation_duration_value() {
        // GIVEN / WHEN
        let duration = ProgressBarIndeterminateConstants.Animation.duration

        // THEN
        XCTAssertEqual(duration, 0.4)
    }

    func test_animation_maxWidthRatio_value() {
        // GIVEN / WHEN
        let maxWidthRatio = ProgressBarIndeterminateConstants.Animation.maxWidthRatio

        // THEN
        XCTAssertEqual(maxWidthRatio, 0.5)
    }
}
