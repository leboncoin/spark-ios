//
//  BorderRuleTests.swift
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

struct BorderRuleTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Border Width Tests

    @Test(arguments: [AvatarSize.xs, .sm, .md])
    func borderWidthWithSmallSizeAndBorderShouldReturnSmallWidth(size: AvatarSize) {
        // WHEN
        let result = self.theme.borderWidth(isBorder: true, size: size)

        // THEN
        #expect(result == self.theme.border.width.small)
    }

    @Test(arguments: [AvatarSize.lg, .xl, .xxl, .xxxl])
    func borderWidthWithLargeSizeAndBorderShouldReturnMediumWidth(size: AvatarSize) {
        // WHEN
        let result = self.theme.borderWidth(isBorder: true, size: size)

        // THEN
        #expect(result == self.theme.border.width.medium)
    }

    @Test(arguments: AvatarSize.allCases)
    func borderWidthWithoutBorderShouldReturnNoneWidth(size: AvatarSize) {
        // WHEN
        let result = self.theme.borderWidth(isBorder: false, size: size)

        // THEN
        #expect(result == self.theme.border.width.none)
    }

    // MARK: - Border Radius Tests

    @Test
    func borderRadiusWithUserContentTypeShouldReturnFullRadius() {
        // WHEN
        let result = self.theme.borderRadius(contentType: .user)

        // THEN
        #expect(result == self.theme.border.radius.full)
    }

    @Test
    func borderRadiusWithCompanyContentTypeShouldReturnMediumRadius() {
        // WHEN
        let result = self.theme.borderRadius(contentType: .company)

        // THEN
        #expect(result == self.theme.border.radius.medium)
    }
}
