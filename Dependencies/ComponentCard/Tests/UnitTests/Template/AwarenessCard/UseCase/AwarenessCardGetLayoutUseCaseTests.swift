//
//  AwarenessCardGetLayoutUseCaseTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 17/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentCard
@testable @_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

@Suite("AwarenessCardGetLayoutUseCase Tests")
struct AwarenessCardGetLayoutUseCaseTests {

    // MARK: - Properties

    private let useCase = AwarenessCardGetLayoutUseCase()
    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test("Execute returns correct layout with theme spacing values")
    func execute() {
        // GIVEN / WHEN
        let layout = self.useCase.execute(theme: self.theme)

        // THEN
        #expect(layout.horizontalSpacing == self.theme.layout.spacing.medium)
        #expect(layout.verticalSpacing == self.theme.layout.spacing.small)
    }
}
