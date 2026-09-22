//
//  CardGetTypographiesUseCaseTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 11/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentCard
@testable @_spi(SI_SPI) import SparkThemingTesting

struct CardGetTypographiesUseCaseTests {

    // MARK: - Properties

    private let useCase = CardGetTypographiesUseCase()
    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test
    func executeWithBannerPosition() {
        // GIVEN
        let headerPosition = CardHeaderPosition.banner

        // WHEN
        let typographies = self.useCase.execute(
            theme: self.theme,
            headerPosition: headerPosition
        )

        // THEN
        #expect(typographies.headerFontToken.font == self.theme.typography.body2Highlight.font)
        #expect(typographies.headerFontToken.uiFont == self.theme.typography.body2Highlight.uiFont)
    }

    @Test
    func executeWithBorderPosition() {
        // GIVEN
        let headerPosition = CardHeaderPosition.border

        // WHEN
        let typographies = self.useCase.execute(
            theme: self.theme,
            headerPosition: headerPosition
        )

        // THEN
        #expect(typographies.headerFontToken.font == self.theme.typography.captionHighlight.font)
        #expect(typographies.headerFontToken.uiFont == self.theme.typography.captionHighlight.uiFont)
    }
}
