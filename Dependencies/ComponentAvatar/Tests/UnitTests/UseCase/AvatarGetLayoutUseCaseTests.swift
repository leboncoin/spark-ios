//
//  AvatarGetLayoutUseCaseTests.swift
//  SparkComponentAvatarTests
//
//  Created by robin.lemaire on 03/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentAvatar
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct AvatarGetLayoutUseCaseTests {

    // MARK: - Properties

    private let sut = AvatarGetLayoutUseCase()
    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test
    func executeShouldReturnExpectedLayout() {
        // WHEN
        let result = self.sut.execute(theme: self.theme)

        let expectedLayout = AvatarLayout(
            actionPadding: self.theme.layout.spacing.medium
        )

        // THEN
        #expect(result == expectedLayout)
    }
}
