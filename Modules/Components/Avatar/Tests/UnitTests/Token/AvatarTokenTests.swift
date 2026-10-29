//
//  AvatarTokenTests.swift
//  SparkComponentAvatarTests
//
//  Created by Robin Lemaire on 23/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentAvatar
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct AvatarTokenTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()
    private let otherTheme = ThemeGeneratedMock.mocked2()

    // MARK: - Initialization Tests

    @Test("Init should set theme dependent categories from theme")
    func initShouldSetThemeDependentCategoriesFromTheme() {
        // GIVEN / WHEN
        let token = AvatarToken(theme: self.theme)

        // THEN
        #expect(token.border == AvatarToken.Border(theme: self.theme))
        #expect(token.colors == AvatarToken.Colors(theme: self.theme))
        #expect(token.layout == AvatarToken.Layout(theme: self.theme))
        #expect(token.opacity == AvatarToken.Opacity(theme: self.theme))
        #expect(token.typography == AvatarToken.Typography(theme: self.theme))
    }

    @Test("Init should set theme independent categories")
    func initShouldSetThemeIndependentCategories() {
        // GIVEN / WHEN
        let token = AvatarToken(theme: self.theme)

        // THEN
        #expect(token.size == AvatarToken.Size())
        #expect(token.scaleEffect == AvatarToken.ScaleEffect())
        #expect(token.cornerViewOffset == AvatarToken.CornerViewOffset())
    }

    // MARK: - Equatable Tests

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = AvatarToken(theme: self.theme)
        let rhs = AvatarToken(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = AvatarToken(theme: self.theme)
        let rhs = AvatarToken(theme: self.otherTheme)

        // WHEN / THEN
        #expect(lhs != rhs)
    }

    @Test("Equatable with different theme should keep theme independent categories equal")
    func equatableWithDifferentThemeShouldKeepThemeIndependentCategoriesEqual() {
        // GIVEN
        let lhs = AvatarToken(theme: self.theme)
        let rhs = AvatarToken(theme: self.otherTheme)

        // WHEN / THEN
        #expect(lhs.size == rhs.size)
        #expect(lhs.scaleEffect == rhs.scaleEffect)
        #expect(lhs.cornerViewOffset == rhs.cornerViewOffset)
    }
}
