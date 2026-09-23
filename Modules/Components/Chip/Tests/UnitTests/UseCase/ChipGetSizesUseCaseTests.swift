//
//  ChipGetSizesUseCaseTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 09/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentChip
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

struct ChipGetSizesUseCaseTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()
    private let useCase = ChipGetSizesUseCase()

    // MARK: - Tests

    @Test
    func execute_with_medium_size() {
        // GIVEN
        let token = ChipToken.Size()

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            size: .medium
        )

        // THEN
        #expect(result.height == token.mediumHeight)
        #expect(result.iconSize == token.iconSize)
    }

    @Test
    func execute_with_large_size() {
        // GIVEN
        let token = ChipToken.Size()

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            size: .large
        )

        // THEN
        #expect(result.height == token.largeHeight)
        #expect(result.iconSize == token.iconSize)
    }

    @Test
    func execute_returns_different_heights_for_different_sizes() {
        // GIVEN / WHEN
        let mediumResult = self.useCase.execute(
            theme: self.theme,
            size: .medium
        )

        let largeResult = self.useCase.execute(
            theme: self.theme,
            size: .large
        )

        // THEN
        #expect(mediumResult.height != largeResult.height)
        #expect(largeResult.height > mediumResult.height)
    }

    @Test
    func execute_returns_same_iconSize_for_all_sizes() {
        // GIVEN / WHEN
        let mediumResult = self.useCase.execute(
            theme: self.theme,
            size: .medium
        )

        let largeResult = self.useCase.execute(
            theme: self.theme,
            size: .large
        )

        // THEN
        #expect(mediumResult.iconSize == largeResult.iconSize)
    }
}
