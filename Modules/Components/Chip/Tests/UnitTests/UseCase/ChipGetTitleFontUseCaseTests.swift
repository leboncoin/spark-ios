//
//  ChipGetTitleFontUseCaseTests.swift
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
@Suite("Chip Get Title Font UseCase Tests")
struct ChipGetTitleFontUseCaseTests {

    // MARK: - Tests

    @Test("Execute returns correct font")
    func executeReturnsCorrectFont() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let token = ChipToken.Typography(theme: theme)
        let useCase = ChipGetTitleFontUseCase()

        // WHEN
        let result = useCase.execute(theme: theme)

        // THEN
        #expect(result.equals(token.title))
    }
}
