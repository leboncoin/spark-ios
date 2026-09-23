//
//  AwarenessCardGetTypographiesUseCaseTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 17/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentCard
@testable @_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

@Suite("AwarenessCardGetTypographiesUseCase Tests")
struct AwarenessCardGetTypographiesUseCaseTests {

    // MARK: - Properties

    private let useCase = AwarenessCardGetTypographiesUseCase()
    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test("Execute returns correct typographies with theme font tokens")
    func execute() {
        // GIVEN / WHEN
        let typographies = self.useCase.execute(theme: self.theme)

        // THEN
        #expect(typographies.titleFontToken.font == self.theme.typography.subhead.font)
        #expect(typographies.titleFontToken.uiFont == self.theme.typography.subhead.uiFont)
        #expect(typographies.descriptionFontToken.font == self.theme.typography.body1.font)
        #expect(typographies.descriptionFontToken.uiFont == self.theme.typography.body1.uiFont)
    }
}
