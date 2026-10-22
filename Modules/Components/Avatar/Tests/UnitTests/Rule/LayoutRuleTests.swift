//
//  LayoutRuleTests.swift
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

struct LayoutRuleTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test
    func actionPaddingShouldReturnMediumSpacing() {
        // GIVEN / WHEN
        let result = self.theme.actionPadding

        // THEN
        #expect(result == self.theme.layout.spacing.medium)
    }
}
