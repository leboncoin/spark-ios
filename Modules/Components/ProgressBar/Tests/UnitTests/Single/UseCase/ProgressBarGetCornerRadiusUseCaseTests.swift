//
//  ProgressBarGetCornerRadiusUseCaseTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 17/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
@testable import SparkComponentProgressBar
@_spi(SI_SPI) import SparkThemingTesting

final class ProgressBarGetCornerRadiusUseCaseTests: XCTestCase {

    // MARK: - Properties

    private let themeMock = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    func test_execute_cornerRadius_when_shape_is_rounded_case() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenShape: .rounded,
            expectedRadius: self.themeMock.border.radius.full
        )
    }

    func test_execute_cornerRadius_when_shape_is_square_case() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenShape: .square,
            expectedRadius: 0
        )
    }
}

// MARK: - Execute Testing

private extension ProgressBarGetCornerRadiusUseCaseTests {

    func testExecute(
        givenShape: ProgressBarShape,
        expectedRadius: CGFloat
    ) {
        // GIVEN
        let useCase = ProgressBarGetCornerRadiusUseCase()

        // WHEN
        let cornerRadius = useCase.execute(
            theme: self.themeMock,
            shape: givenShape
        )

        // THEN
        XCTAssertEqual(
            cornerRadius,
            expectedRadius,
            "Wrong corner radius for .\(givenShape) shape case"
        )
    }
}
