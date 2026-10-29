//
//  ComponentToken+AvatarTests.swift
//  SparkComponentAvatarTests
//
//  Created by Robin Lemaire on 23/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentAvatar
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct ComponentTokenAvatarTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test
    func avatarShouldReturnTokenFromTheme() {
        // GIVEN
        let componentToken = ComponentToken(theme: self.theme)

        // WHEN
        let token = componentToken.avatar

        // THEN
        #expect(token == AvatarToken(theme: self.theme))
    }

    @Test
    func avatarFromThemeComponentShouldReturnTokenFromTheme() {
        // GIVEN / WHEN
        let token = self.theme.component.avatar

        // THEN
        #expect(token == AvatarToken(theme: self.theme))
    }

    @Test
    func avatarWithDifferentThemeShouldNotReturnTokenFromTheme() {
        // GIVEN
        let componentToken = ComponentToken(theme: ThemeGeneratedMock.mocked2())

        // WHEN
        let token = componentToken.avatar

        // THEN
        #expect(token != AvatarToken(theme: self.theme))
    }
}
