//
//  AvatarToken+ColorsTests.swift
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

struct AvatarTokenColorsTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: AvatarToken.Colors {
        return .init(theme: self.theme)
    }

    // MARK: - Border Tests

    @Test
    func borderShouldReturnOutline() {
        // GIVEN / WHEN
        let result = self.token.border

        // THEN
        #expect(result.equals(self.theme.colors.base.outline))
    }

    // MARK: - Background Tests

    @Test
    func backgroundWithUserShouldReturnSurfaceInverse() {
        // GIVEN / WHEN
        let result = self.token.background(contentType: .user)

        // THEN
        #expect(result.equals(self.theme.colors.base.surfaceInverse))
    }

    @Test
    func backgroundWithCompanyShouldReturnNeutralContainer() {
        // GIVEN / WHEN
        let result = self.token.background(contentType: .company)

        // THEN
        #expect(result.equals(self.theme.colors.feedback.neutralContainer))
    }

    // MARK: - Placeholder Tint Tests

    @Test
    func placeholderTintWithUserShouldReturnOnSurfaceInverse() {
        // GIVEN / WHEN
        let result = self.token.placeholderTint(contentType: .user)

        // THEN
        #expect(result.equals(self.theme.colors.base.onSurfaceInverse))
    }

    @Test
    func placeholderTintWithCompanyShouldReturnOnNeutralContainer() {
        // GIVEN / WHEN
        let result = self.token.placeholderTint(contentType: .company)

        // THEN
        #expect(result.equals(self.theme.colors.feedback.onNeutralContainer))
    }

    // MARK: - Action Background Tests

    @Test
    func actionBackgroundWhenNotPressedShouldReturnSurface() {
        // GIVEN / WHEN
        let result = self.token.actionBackground(isPressed: false)

        // THEN
        #expect(result.equals(self.theme.colors.base.surface))
    }

    @Test
    func actionBackgroundWhenPressedShouldReturnSurfacePressed() {
        // GIVEN / WHEN
        let result = self.token.actionBackground(isPressed: true)

        // THEN
        #expect(result.equals(self.theme.colors.states.surfacePressed))
    }

    // MARK: - Action Tint Tests

    @Test
    func actionTintWhenNotPressedShouldReturnNeutral() {
        // GIVEN / WHEN
        let result = self.token.actionTint(isPressed: false)

        // THEN
        #expect(result.equals(self.theme.colors.feedback.neutral))
    }

    @Test
    func actionTintWhenPressedShouldReturnNeutralPressed() {
        // GIVEN / WHEN
        let result = self.token.actionTint(isPressed: true)

        // THEN
        #expect(result.equals(self.theme.colors.states.neutralPressed))
    }

    // MARK: - Equatable Tests

    @Test
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = AvatarToken.Colors(theme: self.theme)
        let rhs = AvatarToken.Colors(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = AvatarToken.Colors(theme: self.theme)
        let rhs = AvatarToken.Colors(theme: ThemeGeneratedMock.mocked2())

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
