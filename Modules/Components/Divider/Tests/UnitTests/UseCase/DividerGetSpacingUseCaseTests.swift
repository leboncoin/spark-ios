//
//  DividerGetSpacingUseCaseTests.swift
//  SparkComponentDividerTests
//
//  Created by robin.lemaire on 12/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import SparkTheming

@_spi(SI_SPI) import SparkComponentDividerTesting
@_spi(SI_SPI) import SparkThemingTesting

@testable import SparkComponentDivider

@Suite("Divider Get Spacing UseCase Tests")
struct DividerGetSpacingUseCaseTests {

    // MARK: - Execute Tests

    @Test("Execute returns large spacing")
    func executeReturnsLargeSpacing() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let useCase = DividerGetSpacingUseCase()

        // WHEN
        let spacing = useCase.execute(theme: theme)

        // THEN
        #expect(
            spacing == theme.layout.spacing.large,
            "Execute should return theme.layout.spacing.large"
        )
    }
}
