//
//  ChipGetLayoutUseCaseTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import Testing
@testable import SparkComponentChip
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@MainActor
@Suite("Chip Get Layout UseCase Tests")
struct ChipGetLayoutUseCaseTests {

    // MARK: - Properties

    private let sut: ChipGetLayoutUseCase
    private let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.sut = ChipGetLayoutUseCase()
        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Tests

    @Test("Execute with leading icon alignment")
    func executeWithLeadingIconAlignment() {
        // GIVEN
        let token = ChipToken.Layout(theme: self.theme)

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            alignment: .leadingIcon
        )

        // THEN
        #expect(result.spacing == token.spacing(alignment: .leadingIcon))
        #expect(result.extraContentSpacing == token.extraContentSpacing)
        #expect(result.padding == token.horizontalPadding)
    }

    @Test("Execute with trailing icon alignment")
    func executeWithTrailingIconAlignment() {
        // GIVEN
        let token = ChipToken.Layout(theme: self.theme)

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            alignment: .trailingIcon
        )

        // THEN
        #expect(result.spacing == token.spacing(alignment: .trailingIcon))
        #expect(result.extraContentSpacing == token.extraContentSpacing)
        #expect(result.padding == token.horizontalPadding)
    }
}
