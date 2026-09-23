//
//  ChipGetDimUseCaseTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import XCTest
@testable import SparkComponentChip
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class ChipGetDimUseCaseTests: XCTestCase {

    // MARK: - Tests

    func test_execute_when_isEnabled() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let token = ChipToken.Opacity(theme: theme)
        let useCase = ChipGetDimUseCase()

        // WHEN
        let result = useCase.execute(
            theme: theme,
            isEnabled: true
        )

        // THEN
        XCTAssertEqual(result, token.whenEnabled)
    }

    func test_execute_when_isDisabled() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let token = ChipToken.Opacity(theme: theme)
        let useCase = ChipGetDimUseCase()

        // WHEN
        let result = useCase.execute(
            theme: theme,
            isEnabled: false
        )

        // THEN
        XCTAssertEqual(result, token.whenDisabled)
    }
}
