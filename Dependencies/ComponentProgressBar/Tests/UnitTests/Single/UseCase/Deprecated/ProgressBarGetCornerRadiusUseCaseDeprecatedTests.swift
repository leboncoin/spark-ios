//
//  ProgressBarGetCornerRadiusUseCaseDeprecatedTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 06/10/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
@testable import SparkComponentProgressBar
@_spi(SI_SPI) import SparkThemingTesting

@available(*, deprecated, message: "Not used anymore by the new SparkProgressBar or SparkUIProgressBar")
final class ProgressBarGetCornerRadiusUseCaseDeprecatedTests: XCTestCase {

    // MARK: - Properties

    private let borderMock = BorderGeneratedMock.mocked()

    // MARK: - Tests

    func test_execute_cornerRadius_when_shape_is_rounded_case() {
        self.testExecute(
            givenShape: .rounded,
            expectedRadius: self.borderMock.radius.full
        )
    }

    func test_execute_cornerRadius_when_shape_is_square_case() {
        self.testExecute(
            givenShape: .square,
            expectedRadius: 0
        )
    }
}

// MARK: - Execute Testing

private extension ProgressBarGetCornerRadiusUseCaseDeprecatedTests {

    func testExecute(
        givenShape: ProgressBarShape,
        expectedRadius: CGFloat
    ) {
        // GIVEN
        let useCase = ProgressBarGetCornerRadiusUseCaseDeprecated()

        // WHEN
        let cornerRadius = useCase.execute(
            shape: givenShape,
            border: self.borderMock
        )

        // THEN
        XCTAssertEqual(
            cornerRadius,
            expectedRadius,
            "Wrong corner radius for .\(givenShape) shape case"
        )
    }
}
