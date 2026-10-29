//
//  ChipGetBorderUseCaseTests.swift
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
@Suite("Chip Get Border UseCase Tests")
struct ChipGetBorderUseCaseTests {

    // MARK: - Properties

    private let sut: ChipGetBorderUseCase
    private let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.sut = ChipGetBorderUseCase()
        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Tests

    @Test("Execute with outlined variant")
    func executeWithOutlinedVariant() {
        // GIVEN
        let token = ChipToken.Border(theme: self.theme)

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            variant: .outlined
        )

        // THEN
        #expect(result.width == token.width)
        #expect(result.radius == token.radius)
        #expect(result.dash == 0)
    }

    @Test("Execute with tinted variant")
    func executeWithTintedVariant() {
        // GIVEN
        let token = ChipToken.Border(theme: self.theme)

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            variant: .tinted
        )

        // THEN
        #expect(result.width == token.width)
        #expect(result.radius == token.radius)
        #expect(result.dash == 0)
    }

    @Test("Execute with dashed variant")
    func executeWithDashedVariant() {
        // GIVEN
        let token = ChipToken.Border(theme: self.theme)

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            variant: .dashed
        )

        // THEN
        #expect(result.width == token.width)
        #expect(result.radius == token.radius)
        #expect(result.dash == token.dash(variant: .dashed))
    }
}
