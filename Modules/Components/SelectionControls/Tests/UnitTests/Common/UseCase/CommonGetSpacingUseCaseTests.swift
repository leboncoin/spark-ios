//
//  CommonGetSpacingUseCaseTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 10/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Common Get Spacing UseCase Tests")
struct CommonGetSpacingUseCaseTests {

    // MARK: - Tests

    @Test("Execute returns medium spacing")
    func executeReturnsMediumSpacing() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let useCase = CommonGetSpacingUseCase()

        // WHEN
        let result = useCase.execute(theme: theme)

        // THEN
        #expect(result == theme.layout.spacing.medium)
    }
}
