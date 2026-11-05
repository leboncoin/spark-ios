//
//  ChipGetDimUseCaseTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import Testing
@testable import SparkComponentChip
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@MainActor
@Suite("Chip Get Dim UseCase Tests")
struct ChipGetDimUseCaseTests {

    // MARK: - Tests

    @Test("Execute when is enabled")
    func executeWhenIsEnabled() {
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
        #expect(result == token.value(isEnabled: true))
    }

    @Test("Execute when is disabled")
    func executeWhenIsDisabled() {
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
        #expect(result == token.value(isEnabled: false))
    }
}
