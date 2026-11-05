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

    @Test("Border should return outline")
    func borderShouldReturnOutline() {
        // GIVEN / WHEN
        let result = self.token.border

        // THEN
        #expect(result.equals(self.theme.colors.base.outline))
    }

    // MARK: - Background Tests

    @Test("Background with user should return surface inverse")
    func backgroundWithUserShouldReturnSurfaceInverse() {
        // GIVEN / WHEN
        let result = self.token.background(contentType: .user)

        // THEN
        #expect(result.equals(self.theme.colors.base.surfaceInverse))
    }

    @Test("Background with company should return neutral container")
    func backgroundWithCompanyShouldReturnNeutralContainer() {
        // GIVEN / WHEN
        let result = self.token.background(contentType: .company)

        // THEN
        #expect(result.equals(self.theme.colors.feedback.neutralContainer))
    }

    // MARK: - Placeholder Tint Tests

    @Test("Placeholder tint with user should return on surface inverse")
    func placeholderTintWithUserShouldReturnOnSurfaceInverse() {
        // GIVEN / WHEN
        let result = self.token.placeholderTint(contentType: .user)

        // THEN
        #expect(result.equals(self.theme.colors.base.onSurfaceInverse))
    }

    @Test("Placeholder tint with company should return on neutral container")
    func placeholderTintWithCompanyShouldReturnOnNeutralContainer() {
        // GIVEN / WHEN
        let result = self.token.placeholderTint(contentType: .company)

        // THEN
        #expect(result.equals(self.theme.colors.feedback.onNeutralContainer))
    }

    // MARK: - Action Background Tests

    @Test("Action background when not pressed should return surface")
    func actionBackgroundWhenNotPressedShouldReturnSurface() {
        // GIVEN / WHEN
        let result = self.token.actionBackground(isPressed: false)

        // THEN
        #expect(result.equals(self.theme.colors.base.surface))
    }

    @Test("Action background when pressed should return surface pressed")
    func actionBackgroundWhenPressedShouldReturnSurfacePressed() {
        // GIVEN / WHEN
        let result = self.token.actionBackground(isPressed: true)

        // THEN
        #expect(result.equals(self.theme.colors.states.surfacePressed))
    }

    // MARK: - Action Tint Tests

    @Test("Action tint when not pressed should return neutral")
    func actionTintWhenNotPressedShouldReturnNeutral() {
        // GIVEN / WHEN
        let result = self.token.actionTint(isPressed: false)

        // THEN
        #expect(result.equals(self.theme.colors.feedback.neutral))
    }

    @Test("Action tint when pressed should return neutral pressed")
    func actionTintWhenPressedShouldReturnNeutralPressed() {
        // GIVEN / WHEN
        let result = self.token.actionTint(isPressed: true)

        // THEN
        #expect(result.equals(self.theme.colors.states.neutralPressed))
    }

    // MARK: - Equatable Tests

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = AvatarToken.Colors(theme: self.theme)
        let rhs = AvatarToken.Colors(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = AvatarToken.Colors(theme: self.theme)
        let rhs = AvatarToken.Colors(theme: ThemeGeneratedMock.mocked2())

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
