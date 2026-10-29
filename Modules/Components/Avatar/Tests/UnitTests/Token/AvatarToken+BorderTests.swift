//
//  AvatarToken+BorderTests.swift
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

struct AvatarTokenBorderTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: AvatarToken.Border {
        return .init(theme: self.theme)
    }

    // MARK: - Width Tests

    @Test("Width with small size and border should return small width", arguments: [AvatarSize.xs, .sm, .md])
    func widthWithSmallSizeAndBorderShouldReturnSmallWidth(size: AvatarSize) {
        // GIVEN / WHEN
        let result = self.token.width(isBorder: true, size: size)

        // THEN
        #expect(result == self.theme.border.width.small)
    }

    @Test("Width with large size and border should return medium width", arguments: [AvatarSize.lg, .xl, .xxl, .xxxl])
    func widthWithLargeSizeAndBorderShouldReturnMediumWidth(size: AvatarSize) {
        // GIVEN / WHEN
        let result = self.token.width(isBorder: true, size: size)

        // THEN
        #expect(result == self.theme.border.width.medium)
    }

    @Test("Width without border should return none width", arguments: AvatarSize.allCases)
    func widthWithoutBorderShouldReturnNoneWidth(size: AvatarSize) {
        // GIVEN / WHEN
        let result = self.token.width(isBorder: false, size: size)

        // THEN
        #expect(result == self.theme.border.width.none)
    }

    // MARK: - Radius Tests

    @Test("Radius with user content type should return full radius")
    func radiusWithUserContentTypeShouldReturnFullRadius() {
        // GIVEN / WHEN
        let result = self.token.radius(contentType: .user)

        // THEN
        #expect(result == self.theme.border.radius.full)
    }

    @Test("Radius with company content type should return medium radius")
    func radiusWithCompanyContentTypeShouldReturnMediumRadius() {
        // GIVEN / WHEN
        let result = self.token.radius(contentType: .company)

        // THEN
        #expect(result == self.theme.border.radius.medium)
    }

    // MARK: - Equatable Tests

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = AvatarToken.Border(theme: self.theme)
        let rhs = AvatarToken.Border(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = AvatarToken.Border(theme: self.theme)
        let rhs = AvatarToken.Border(theme: ThemeGeneratedMock.mocked2())

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
