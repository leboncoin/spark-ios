//
//  TextInputGetDimUseCaseTests.swift
//  SparkComponentTextInputTests
//
//  Created by robin.lemaire on 20/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SparkTheming
@testable import SparkComponentTextInput
@_spi(SI_SPI) import SparkThemingTesting

final class TextInputGetDimUseCaseTests: XCTestCase {

    // MARK: - Properties

    private let themeMock = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    func test_execute_whenIsEnabledIsTrue_shouldReturnNoneDim() {
        // GIVEN
        let useCase = TextInputGetDimUseCase()

        // WHEN
        let result = useCase.execute(
            theme: self.themeMock,
            isEnabled: true
        )

        // THEN
        XCTAssertEqual(result, self.themeMock.dims.none)
    }

    func test_execute_whenIsEnabledIsFalse_shouldReturnDim3() {
        // GIVEN
        let useCase = TextInputGetDimUseCase()

        // WHEN
        let result = useCase.execute(
            theme: self.themeMock,
            isEnabled: false
        )

        // THEN
        XCTAssertEqual(result, self.themeMock.dims.dim3)
    }
}
