//
//  AvatarGetColorsUseCaseTests.swift
//  SparkComponentAvatarTests
//
//  Created by robin.lemaire on 02/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentAvatar
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct AvatarGetColorsUseCaseTests {

    // MARK: - Properties

    private let sut = AvatarGetColorsUseCase()
    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test
    func executeWithUserContentTypeAndNotPressedShouldReturnExpectedColors() {
        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            contentType: .user,
            isPressed: false
        )

        let expectedColors = AvatarColors(
            backgroundColorToken: self.theme.colors.base.surfaceInverse,
            borderColorToken: self.theme.colors.base.outline,
            placeholderTintColorToken: self.theme.colors.base.onSurfaceInverse,
            actionBackgroundColorToken: self.theme.colors.base.surface,
            actionTintColorToken: self.theme.colors.feedback.neutral
        )

        // THEN
        #expect(result == expectedColors)
    }

    @Test
    func executeWithUserContentTypeAndPressedShouldReturnExpectedColors() {
        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            contentType: .user,
            isPressed: true
        )

        let expectedColors = AvatarColors(
            backgroundColorToken: self.theme.colors.base.surfaceInverse,
            borderColorToken: self.theme.colors.base.outline,
            placeholderTintColorToken: self.theme.colors.base.onSurfaceInverse,
            actionBackgroundColorToken: self.theme.colors.states.surfacePressed,
            actionTintColorToken: self.theme.colors.states.neutralPressed
        )

        // THEN
        #expect(result == expectedColors)
    }

    @Test
    func executeWithCompanyContentTypeAndNotPressedShouldReturnExpectedColors() {
        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            contentType: .company,
            isPressed: false
        )

        let expectedColors = AvatarColors(
            backgroundColorToken: self.theme.colors.feedback.neutralContainer,
            borderColorToken: self.theme.colors.base.outline,
            placeholderTintColorToken: self.theme.colors.feedback.onNeutralContainer,
            actionBackgroundColorToken: self.theme.colors.base.surface,
            actionTintColorToken: self.theme.colors.feedback.neutral
        )

        // THEN
        #expect(result == expectedColors)
    }

    @Test
    func executeWithCompanyContentTypeAndPressedShouldReturnExpectedColors() {
        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            contentType: .company,
            isPressed: true
        )

        let expectedColors = AvatarColors(
            backgroundColorToken: self.theme.colors.feedback.neutralContainer,
            borderColorToken: self.theme.colors.base.outline,
            placeholderTintColorToken: self.theme.colors.feedback.onNeutralContainer,
            actionBackgroundColorToken: self.theme.colors.states.surfacePressed,
            actionTintColorToken: self.theme.colors.states.neutralPressed
        )

        // THEN
        #expect(result == expectedColors)
    }
}
