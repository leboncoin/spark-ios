//
//  ColorsRuleTests.swift
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

struct ColorsRuleTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Border Color Tests

    @Test
    func borderColorTokenShouldReturnOutline() {
        // THEN
        #expect(self.theme.borderColorToken.equals(self.theme.colors.base.outline))
    }

    // MARK: - Background Color Tests

    @Test
    func backgroundColorTokenWithUserContentTypeShouldReturnSurfaceInverse() {
        // WHEN
        let result = self.theme.backgroundColorToken(contentType: .user)

        // THEN
        #expect(result.equals(self.theme.colors.base.surfaceInverse))
    }

    @Test
    func backgroundColorTokenWithCompanyContentTypeShouldReturnNeutralContainer() {
        // WHEN
        let result = self.theme.backgroundColorToken(contentType: .company)

        // THEN
        #expect(result.equals(self.theme.colors.feedback.neutralContainer))
    }

    // MARK: - Placeholder Tint Color Tests

    @Test
    func placeholderTintColorTokenWithUserContentTypeShouldReturnOnSurfaceInverse() {
        // WHEN
        let result = self.theme.placeholderTintColorToken(contentType: .user)

        // THEN
        #expect(result.equals(self.theme.colors.base.onSurfaceInverse))
    }

    @Test
    func placeholderTintColorTokenWithCompanyContentTypeShouldReturnOnNeutralContainer() {
        // WHEN
        let result = self.theme.placeholderTintColorToken(contentType: .company)

        // THEN
        #expect(result.equals(self.theme.colors.feedback.onNeutralContainer))
    }

    // MARK: - Action Background Color Tests

    @Test
    func actionBackgroundColorTokenWhenNotPressedShouldReturnSurface() {
        // WHEN
        let result = self.theme.actionBackgroundColorToken(isPressed: false)

        // THEN
        #expect(result.equals(self.theme.colors.base.surface))
    }

    @Test
    func actionBackgroundColorTokenWhenPressedShouldReturnSurfacePressed() {
        // WHEN
        let result = self.theme.actionBackgroundColorToken(isPressed: true)

        // THEN
        #expect(result.equals(self.theme.colors.states.surfacePressed))
    }

    // MARK: - Action Tint Color Tests

    @Test
    func actionTintColorTokenWhenNotPressedShouldReturnNeutral() {
        // WHEN
        let result = self.theme.actionTintColorToken(isPressed: false)

        // THEN
        #expect(result.equals(self.theme.colors.feedback.neutral))
    }

    @Test
    func actionTintColorTokenWhenPressedShouldReturnNeutralPressed() {
        // WHEN
        let result = self.theme.actionTintColorToken(isPressed: true)

        // THEN
        #expect(result.equals(self.theme.colors.states.neutralPressed))
    }
}
