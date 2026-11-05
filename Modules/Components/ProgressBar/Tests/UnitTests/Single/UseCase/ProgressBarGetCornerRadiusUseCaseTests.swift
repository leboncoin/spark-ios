//
//  ProgressBarGetCornerRadiusUseCaseTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 17/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
@testable import SparkComponentProgressBar
@_spi(SI_SPI) import SparkThemingTesting

@MainActor
@Suite("Progress Bar Get Corner Radius Use Case Tests")
struct ProgressBarGetCornerRadiusUseCaseTests {

    // MARK: - Properties

    private let themeMock = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test("Execute corner radius when shape is rounded case")
    func executeCornerRadiusWhenShapeIsRoundedCase() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenShape: .rounded,
            expectedRadius: self.themeMock.border.radius.full
        )
    }

    @Test("Execute corner radius when shape is square case")
    func executeCornerRadiusWhenShapeIsSquareCase() {
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
        #expect(cornerRadius == expectedRadius, "Wrong corner radius for .\(givenShape) shape case")
    }
}
