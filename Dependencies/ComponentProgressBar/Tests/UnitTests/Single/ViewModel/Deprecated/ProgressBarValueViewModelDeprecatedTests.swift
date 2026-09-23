//
//  ProgressBarValueViewModelDeprecatedTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 20/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import XCTest
@testable import SparkComponentProgressBar

@available(*, deprecated, message: "Not used anymore by the new SparkProgressBar or SparkUIProgressBar")
final class ProgressBarValueViewModelDeprecatedTests: XCTestCase {

    // MARK: - Tests

    func test_isValidIndicatorValue_when_value_parameter_is_valid() throws {
        // GIVEN
        let viewModel = ProgressBarValueViewModelDeprecatedMock()

        let values = [
            0,
            0.3,
            0.5,
            0.8,
            1.0
        ]

        // WHEN
        for value in values {
            let isValid = viewModel.isValidIndicatorValue(value)

            // THEN
            XCTAssertTrue(
                isValid,
                "Wrong isValid when value is \(value)"
            )
        }
    }

    func test_isValidIndicatorValue_when_value_parameter_is_invalid() throws {
        // GIVEN
        let viewModel = ProgressBarValueViewModelDeprecatedMock()

        let values = [
            -0.1 as CGFloat,
             -2,
             1.1,
             2
        ]

        // WHEN
        for value in values {
            let value = viewModel.isValidIndicatorValue(value)

            // THEN
            XCTAssertFalse(
                value,
                "Wrong isValid when value is \(value)"
            )
        }
    }
}

// MARK: - Mock

private struct ProgressBarValueViewModelDeprecatedMock: ProgressBarValueViewModelDeprecated {
}
