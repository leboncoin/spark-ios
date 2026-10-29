//
//  CommonGetTitleStyleUseCaseTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 10/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Common Get Title Style UseCase Tests")
struct CommonGetTitleStyleUseCaseTests {

    // MARK: - Tests

    @Test("Execute")
    func execute() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let useCase = CommonGetTitleStyleUseCase()

        // WHEN
        let result = useCase.execute(theme: theme)

        // THEN
        #expect(result.typography.equals(theme.typography.body1))
        #expect(result.color.equals(theme.colors.base.onSurface))
    }
}
