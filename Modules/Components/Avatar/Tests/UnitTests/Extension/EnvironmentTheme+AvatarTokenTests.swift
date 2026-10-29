//
//  EnvironmentTheme+AvatarTokenTests.swift
//  SparkComponentAvatarTests
//
//  Created by Robin Lemaire on 23/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentAvatar
@testable import SparkCommon
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct EnvironmentThemeAvatarTokenTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var environmentTheme: EnvironmentTheme {
        return .init(value: self.theme)
    }

    // MARK: - Tests

    @Test("Border should return avatar border")
    func borderShouldReturnAvatarBorder() {
        #expect(self.environmentTheme.border == self.theme.component.avatar.border)
    }

    @Test("Colors should return avatar colors")
    func colorsShouldReturnAvatarColors() {
        #expect(self.environmentTheme.colors == self.theme.component.avatar.colors)
    }

    @Test("Layout should return avatar layout")
    func layoutShouldReturnAvatarLayout() {
        #expect(self.environmentTheme.layout == self.theme.component.avatar.layout)
    }

    @Test("Opacity should return avatar opacity")
    func opacityShouldReturnAvatarOpacity() {
        #expect(self.environmentTheme.opacity == self.theme.component.avatar.opacity)
    }

    @Test("Typography should return avatar typography")
    func typographyShouldReturnAvatarTypography() {
        #expect(self.environmentTheme.typography == self.theme.component.avatar.typography)
    }

    @Test("Size should return avatar size")
    func sizeShouldReturnAvatarSize() {
        #expect(self.environmentTheme.size == self.theme.component.avatar.size)
    }

    @Test("Scale effect should return avatar scale effect")
    func scaleEffectShouldReturnAvatarScaleEffect() {
        #expect(self.environmentTheme.scaleEffect == self.theme.component.avatar.scaleEffect)
    }

    @Test("Corner view offset should return avatar corner view offset")
    func cornerViewOffsetShouldReturnAvatarCornerViewOffset() {
        #expect(self.environmentTheme.cornerViewOffset == self.theme.component.avatar.cornerViewOffset)
    }
}
